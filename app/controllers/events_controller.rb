class EventsController < ApplicationController
  def index
    if params[:time_frame].nil? then
      @events = Event.all_from_today
      @context = 'HOJE'
      if @events.empty? then
        @events = Event.all_from_current_week
        @context = 'SEMANA'
        if @events.empty? then
          @events = Event.all_from_next_30_days
          @context = 'MÊS'
        end
      end
    elsif params[:time_frame] == '0' then
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
    @context = 'DETALHE'
  end

  def search
    @context = 'BUSCA'
  end

  def colaborate
    @context = 'COLABORAR'
  end

  def about
    @context = 'SOBRE'
  end
end
