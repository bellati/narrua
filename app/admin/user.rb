ActiveAdmin.register User do
  actions :index, :show

  menu priority: 3

  index do
    column :name
    column :auto_publish
    column :created_at
    column :updated_at
    actions
  end

end
