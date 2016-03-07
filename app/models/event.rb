class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'

  def self.from_facebook(facebook, user)
    # event must be public and belong to the city of Brasília
    return if facebook['type'].nil?
    return if facebook['type'] != 'public'
    return if facebook['place'].nil?
    return if facebook['place']['location'].nil?
    return if facebook['place']['location']['city'] != 'Brasília'

    where(facebook_id: facebook['id']).first_or_initialize.tap do |event|
      if event.id.nil?
        event.creator_id = user.id
        event.is_approved = user.is_approved
      end
      event.facebook_id = facebook['id']
      event.attending_count = facebook['attending_count']
      event.can_guests_invite = facebook['can_guests_invite']
      event.category = facebook['category']
      if !facebook['cover'].nil? then
          event.cover_offset_x = facebook['cover']['offset_x']
          event.cover_offset_y = facebook['cover']['offset_y']
          event.cover_source = facebook['cover']['source']
          event.cover_id = facebook['cover']['id']
      end
      event.declined_count = facebook['declined_count']
      event.set_description(facebook['description'])
      event.end_time = facebook['end_time']
      event.guest_list_enabled = facebook['guest_list_enabled']
      event.interested_count = facebook['interested_count']
      event.is_page_owned = facebook['is_page_owned']
      event.is_viewer_admin = facebook['is_viewer_admin']
      event.maybe_count = facebook['maybe_count']
      event.name = facebook['name']
      event.noreply_count = facebook['noreply_count']
      event.owner_name = facebook['owner']['name']
      event.owner_id = facebook['owner']['id']
      event.parent_group = facebook['parent_group']
      event.place_name = facebook['place']['name']
      event.place_location_city = facebook['place']['location']['city']
      event.place_location_country = facebook['place']['location']['country']
      event.place_location_latitude = facebook['place']['location']['latitude']
      event.place_location_longitude = facebook['place']['location']['longitude']
      event.place_location_state = facebook['place']['location']['state']
      event.set_place_location_street(facebook['place']['location']['street'])
      event.place_id = facebook['place']['id']
      event.start_time = facebook['start_time']
      event.timezone = facebook['timezone']
      event.updated_time = facebook['updated_time']
      event.set_duration_in_days(facebook['start_time'], facebook['end_time'])
      event.save!
    end
  end

  def self.all_from_today
    now = Time.now
    lower_limit = nil
    upper_limit = nil

    # se for entre meia-noite e seis da manhã...
    if now.hour >= 0 and now.hour <= 6 then
      # os eventos de ontem são mostrados até 6 horas da manhã de hoje
      lower_limit = now.to_datetime.yesterday.at_beginning_of_day
      upper_limit = now.to_datetime.at_beginning_of_day + 6.hours
    else
      lower_limit = now.to_datetime.at_beginning_of_day
      upper_limit = now.to_datetime.at_end_of_day + 6.hours + 1.second
    end
    Event.where('is_approved = true AND ' +
                '((end_time IS NULL AND start_time >= ? AND start_time <= ?) OR ' + 
                '(end_time IS NOT NULL AND start_time <= ? AND end_time >= ?))', 
                lower_limit, upper_limit,
                upper_limit, now.to_datetime).order(attending_count: :desc)
  end

  def self.all_from_current_week
    now = Time.now
    Event.all_from_today_to_known_future(now, (now.to_datetime + 1 + ((6 - now.to_datetime.wday) % 7)).at_end_of_day)
  end

  def self.all_from_next_30_days
    now = Time.now
    Event.all_from_today_to_known_future(now, (now.to_datetime + 30.day).at_end_of_day)
  end


  def self.all_current_or_future
    now = Time.now
    lower_limit = nil
    if now.hour >= 0 and now.hour <= 6 then
        lower_limit = now.to_datetime.yesterday.at_beginning_of_day
    else
        lower_limit = now.to_datetime.at_beginning_of_day
    end
    Event.where('(end_time IS NULL AND start_time >= ?) OR ' + 
            '(end_time IS NOT NULL AND end_time >= ?)', 
            lower_limit, now.to_datetime)
  end

  def self.all_current_or_future_not_approved
    now = Time.now
    lower_limit = nil
    if now.hour >= 0 and now.hour <= 6 then
        lower_limit = now.to_datetime.yesterday.at_beginning_of_day
    else
        lower_limit = now.to_datetime.at_beginning_of_day
    end
    Event.where('is_approved = false AND ' + 
                '((end_time IS NULL AND start_time >= ?) OR ' + 
                '(end_time IS NOT NULL AND end_time >= ?))', 
                lower_limit, now.to_datetime)
  end

  def set_description(description)
    s = description
    if !s.nil? then
        s = s.gsub(/\n/, "<br/>")
        s = s.gsub(/(\d{1,3}([\,\.]\d{1,2})? {0,}((rea[il]s?)|(\$)))/i, '<div class="price">\1</div>') #sufixo
        s = s.gsub(/((preço|entrada|custo|quanto|r\$|\$|ingressos?) {0,}\:? {0,}\d{1,3}([\.\,]\d{1,2})?)/i, '<div class="price">\1</div>') #prefixo
        s = s.gsub(/(((https?\:\/\/)|(www))[a-zãàáäâéëèêíïîìòõôóöúüûùç\d\-\_\.\/\%\=\&\?]+)/i, '<div class="link"><a href="\1">LINK</a></div>')
    end
    self.description = s
  end

  def set_place_location_street(place_location_street)
    if place_location_street.nil?
        self.place_location_street = self.place_name
    else
        self.place_location_street = place_location_street
    end
  end

  def set_duration_in_days(start_time, end_time)
    if end_time.nil?
      self.duration_in_days = 0
    else 
      self.duration_in_days = (DateTime.parse(end_time) - DateTime.parse(start_time)).to_i
    end
  end

  private
  def self.all_from_today_to_known_future(now, upper_limit)
    lower_limit = nil

    if now.hour >= 0 and now.hour <= 6 then
      lower_limit = now.to_datetime.yesterday.at_beginning_of_day
    else
      lower_limit = now.to_datetime.at_beginning_of_day
    end
    
    Event.where('is_approved = true AND ' +
                '((end_time IS NULL AND start_time >= ? AND start_time <= ?) OR ' + 
                '(end_time IS NOT NULL AND start_time <= ? AND end_time >= ?))', 
                lower_limit, upper_limit,
                upper_limit, now.to_datetime).order(start_time: :asc, attending_count: :desc)
  end
end
