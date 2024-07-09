class EventsController < ApplicationController

  def show
    @events = Event.where(id: event_ids)
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time)
  end

  def event_ids
    JSON.parse(params[:ids])
  end

end
