class EventsController < ApplicationController
  def index
    @events = Event.all_from_today
  end

  def show
    @event = Event.find(params[:id])
  end

  def search
  end

  def colaborate
  end

  def get_from_facebook
    FB.new(User.find(params[:user_id])).get_events()
    redirect_to colaborate_path, notice: true
  end
end
