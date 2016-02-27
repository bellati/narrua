class EventsController < ApplicationController
  def index
    date = Time.now.to_datetime + 3.hour
    @events = Event.where(
      'extract(year from start_time) = ? AND ' + 
      'extract(month from start_time) = ? AND ' +
      'extract(day from start_time) = ?', 
      date.year,
      date.month,
      date.day
    )
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
