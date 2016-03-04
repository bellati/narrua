class UsersController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    redirect_to colaborate_path, notice: true
  end
end
