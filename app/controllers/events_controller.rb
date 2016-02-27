class EventsController < ApplicationController
  def index
    now = Time.now
    lower_limit = nil
    upper_limit = nil

    # se for entre meia-noite e quatro da manhã...
    if now.hour >= 0 and now.hour <= 3 then
      # vê os eventos de ontem que começaram até 8hrs e os que começaram até 4 horas da manhã de hoje
      lower_limit = now.to_datetime.at_beginning_of_day() - 4.hour - 1.second
      upper_limit = now.to_datetime.at_beginning_of_day() + 4.hour + 1.second
    else
      # senão... vê os eventos que começaram entre até 5 horas atrás de agora (assume que acabou) e 4 horas da manhã do dia seguinte
      lower_limit = now.to_datetime - 5.hour - 1.second
      upper_limit = now.to_datetime.at_end_of_day() + 4.hour + 1.second
    end
    @events = Event.where('start_time >= ? AND start_time <= ?', lower_limit, upper_limit).order(attending_count: :desc)

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
