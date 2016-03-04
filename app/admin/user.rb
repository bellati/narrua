ActiveAdmin.register User do
  actions :index, :show

  menu priority: 3

  member_action :approve, method: :put do
  end

  action_item :approve, only: [:show] do
    link_to 'Approve', approve_admin_user_path(user), method: :put
  end

  member_action :disapprove, method: :put do
  end

  action_item :disapprove, only: [:show] do
    link_to 'Disapprove', disapprove_admin_user_path(user), method: :put
  end

  controller do
    def approve
      user = User.find(params[:id])
      if user.is_approved then
        redirect_to admin_users_path, alert: 'User is already approved!'
      else
        user.is_approved = true
        user.save!
        redirect_to admin_users_path, notice: 'User was approved!'
      end
    end

    def disapprove
      user = User.find(params[:id])
      if !user.is_approved then
        redirect_to admin_users_path, alert: 'User is already disapproved!'
      else
        user.is_approved = false
        user.save!
        redirect_to admin_users_path, notice: 'User was disapproved!'
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
        link_to 'Disapprove', disapprove_admin_user_path(user), method: :put
      else
        link_to 'Approve', approve_admin_user_path(user), method: :put
      end
    end
  end

end
