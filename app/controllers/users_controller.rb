class UsersController < ApplicationController
  def create
    User.from_omniauth(env["omniauth.auth"])
    redirect_to colaborate_path, notice: true
  end
end
