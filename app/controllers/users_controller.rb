class UsersController < ApplicationController
  def create
    User.from_omniauth(env["omniauth.auth"])
    redirect_to root_path
  end
end
