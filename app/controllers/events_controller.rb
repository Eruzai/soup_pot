class EventsController < ApplicationController

  def show
    @events = Event.where(id: event_ids)
  end

  private

  def event_ids
    JSON.parse(params[:ids])
  end

end
