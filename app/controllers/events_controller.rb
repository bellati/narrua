class EventsController < ApplicationController
  def index
    if params[:time_frame].nil? || params[:time_frame] == '0' then
      @events = Event.all_from_today
    elsif params[:time_frame] == '1' then
      @events = Event.all_from_current_week
    elsif params[:time_frame] == '2' then
      @events = Event.all_from_next_30_days
    else
      # TODO: redirect_to 404
      @events = Event.all_from_today
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def search
  end

  def colaborate
  end

  def about
  end
end
