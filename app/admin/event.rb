ActiveAdmin.register Event do
  actions :index, :show

  menu priority: 2
  
  config.sort_order = 'start_time_asc'

  action_item :view, only: [:show] do
    link_to 'View on site', event_path(event), target: "_blank"
  end

  member_action :approve, method: :put do
  end

  action_item :approve, only: [:show] do
    link_to 'Approve', approve_admin_event_path(event), method: :put
  end

  controller do
    def scoped_collection
      Event.all_from_today_or_future
    end

    def approve
      event = Event.find(params[:id])
      if event.is_approved then
        redirect_to admin_events_path, alert: 'Event is already approved!'
      else
        event.is_approved = true
        event.save!
        redirect_to admin_events_path, notice: 'Event was approved!'
      end
    end
  end

  filter :start_time
  filter :end_time
  filter :owner_name
  filter :place_name

  index do
    column :is_approved
    column :start_time
    column :end_time
    column :name
    column :owner_name
    column :place_name
    column :place_location_city
    column :updated_time
    column :created_at
    column :updated_at
    actions
  end

end
