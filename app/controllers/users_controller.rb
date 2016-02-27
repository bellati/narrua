class UsersController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    redirect_to get_from_facebook_path(user_id: user.id), notice: true
  end
end
