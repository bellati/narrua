class Event < ActiveRecord::Base
  def self.from_facebook(facebook)
    where(facebook_id: facebook['id']).first_or_initialize.tap do |event|
      event.facebook_id = facebook['id']
      event.attending_count = facebook['attending_count']
      event.can_guests_invite = facebook['can_guests_invite']
      event.category = facebook['category']
      event.cover_offset_x = facebook['cover']['offset_x']
      event.cover_offset_y = facebook['cover']['offset_y']
      event.cover_source = facebook['cover']['source']
      event.cover_id = facebook['cover']['id']
      event.declined_count = facebook['declined_count']
      event.description = facebook['description']
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
      event.place_location_street = facebook['place']['location']['street']
      event.place_id = facebook['place']['id']
      event.start_time = facebook['start_time']
      event.timezone = facebook['timezone']
      event.updated_time = facebook['updated_time']
      event.save!
    end
  end
end
