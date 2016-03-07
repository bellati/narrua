class EventsController < ApplicationController
  def index
    if params[:time_frame].nil? || params[:time_frame] == '0' then
      @events = Event.all_from_today
      @context = 'HOJE'
    elsif params[:time_frame] == '1' then
      @events = Event.all_from_current_week
      @context = 'SEMANA'
    elsif params[:time_frame] == '2' then
      @events = Event.all_from_next_30_days
      @context = 'MÊS'
    else
      # TODO: redirect_to 404
      @events = Event.all_from_today
      @context = 'HOJE'
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
