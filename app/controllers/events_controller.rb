class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def search
  end

  def colaborate
  end

  def get_from_facebook
    FB.new(User.find(params[:user_id]).oauth_token).get_events()
    redirect_to colaborate_path, notice: true
  end
end
