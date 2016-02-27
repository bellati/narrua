class EventsController < ApplicationController
  def index
    # se for ate 4 da manhã, vê os eventos que começaram ontem até 8 hrs

    now = Time.now
    lower_limit = nil
    upper_limit = nil

    # se for entre meia-noite e quatro da manhã...
    if now.hour >= 0 and now.hour <= 3 then
      lower_limit = now.to_datetime.at_beginning_of_day() - 4.hour - 1.second
      upper_limit = now.to_datetime.at_beginning_of_day() + 4.hour + 1.second
    else
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
