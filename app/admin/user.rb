ActiveAdmin.register User do
  actions :index, :show

  menu priority: 3

  member_action :dis_approve, method: :put do
  end

  action_item :dis_approve, only: [:show] do
    if user.is_approved then
      link_to 'Disapprove', dis_approve_admin_user_path(user), method: :put, data: {confirm: 'Are you sure?'}
    else
      link_to 'Approve', dis_approve_admin_user_path(user), method: :put, data: {confirm: 'Are you sure?'}
    end
  end

  controller do
    def dis_approve
      user = User.find(params[:id])
      if user.is_approved then
        user.is_approved = false
        user.save!
        redirect_to admin_users_path, notice: 'User "' + user.name + '" was disapproved!'
      else
        user.is_approved = true
        user.save!
        redirect_to admin_users_path, notice: 'User "' + user.name + '" was approved!'
      end
    end
  end

  index do
    column :name
    column :is_approved
    column :created_at
    column :updated_at
    actions defaults: true do |user|
      if user.is_approved then
        link_to 'Disapprove', dis_approve_admin_user_path(user), method: :put, data: {confirm: 'Are you sure?'}
      else
        link_to 'Approve', dis_approve_admin_user_path(user), method: :put, data: {confirm: 'Are you sure?'}
      end
    end
  end

end
