ActiveAdmin.register Event do
  actions :index, :show

  menu priority: 2
  
  config.sort_order = 'start_time_asc'

  controller do
    def scoped_collection
      Event.all_from_today_or_future
    end
  end

  filter :start_time
  filter :end_time
  filter :owner_name
  filter :place_name

  index do
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
