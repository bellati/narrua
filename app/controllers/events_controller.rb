class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def search
  end
end
