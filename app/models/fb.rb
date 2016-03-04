require 'net/http'

class FB
  
  FACEBOOK_GRAPH = 'https://graph.facebook.com/v2.5/'

  def initialize(user)
    @user = user
  end

  def get_events()
    first_page = true
    paging_next = FACEBOOK_GRAPH + 'me?fields=events&access_token=' + @user.oauth_token

    while true do
      events = nil
      response = get_response(paging_next)
      if !response['error'].nil?
        puts 'RECEIVED \'ERROR\' STATUS FROM FACEBOOK API'
        break
      end

      if first_page then
        events = response['events']['data']
        paging_next = response['events']['paging']['next']
        first_page = false
      else
        events = response['data']
        paging_next = response['paging']['next']
      end

      process_events(events)

      break if paging_next.nil?
    end
  end

  def get_event(id)
    get_response(FACEBOOK_GRAPH + id + 
      '?fields=' +
      'id,attending_count,can_guests_invite,category,cover,' +
      'declined_count,description,end_time,guest_list_enabled,' +
      'interested_count,is_page_owned,is_viewer_admin,maybe_count,' +
      'name,noreply_count,owner,parent_group,place,start_time,' +
      'ticket_uri,timezone,type,updated_time' +
      '&access_token=' + @user.oauth_token)
  end

  private
  def process_events(events)
    events.each do |e|
      Event.from_facebook(get_event(e['id']), @user)
    end
  end

  def get_response(path)
    uri = URI(path)
    # TODO: use_ssl
    JSON.parse(Net::HTTP.get_response(uri).body)
  end
end