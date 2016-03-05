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

  def about
  end
end
