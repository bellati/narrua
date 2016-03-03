ActiveAdmin.register Event do
  actions :index, :show

  menu priority: 2

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
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
