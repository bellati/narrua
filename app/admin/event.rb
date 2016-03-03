ActiveAdmin.register Event do
  actions :index, :show

  menu priority: 2

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
