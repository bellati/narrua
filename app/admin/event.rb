ActiveAdmin.register Event do
  actions :index, :show

  menu priority: 2
  
  config.sort_order = 'start_time_asc'

  action_item :view, only: [:show] do
    link_to 'View on site', event_path(event), target: '_blank'
  end

  member_action :dis_approve, method: :put do
  end

  action_item :dis_approve, only: [:show] do
    if event.is_approved then
      link_to 'Disapprove', dis_approve_admin_event_path(event), method: :put
    else
      link_to 'Approve', dis_approve_admin_event_path(event), method: :put
    end
  end

  controller do
    def scoped_collection
      Event.all_from_today_or_future
    end

    def dis_approve
      event = Event.find(params[:id])
      if event.is_approved then
        event.is_approved = false
        event.save!
        redirect_to admin_events_path, notice: 'Event was disapproved!'
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
    column :name
    column :start_time
    column :end_time
    column :is_approved
    column :updated_time
    column :created_at
    column :updated_at
    actions defaults: true do |event|
      if event.is_approved then
        link_to 'Disapprove', dis_approve_admin_event_path(event), method: :put
      else
        link_to 'Approve', dis_approve_admin_event_path(event), method: :put
      end
    end
  end

end
