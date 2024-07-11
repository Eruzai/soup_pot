class EventsController < ApplicationController

  before_action :store_previous_url, only: [:new, :edit, :destroy]

  def store_previous_url
    session[:previous_url] = request.referer if request.referer
  end

  def index
    if current_user
      if params[:ids]
        @events = Event.where(id: event_ids)
      end
      @invite_options = friends_ids.map { |id| ["#{User.find(id).first_name} #{User.find(id).last_name}", "#{id}"]}
      start_date = params.fetch(:start_date, Date.today).to_date
      @my_events = Event.where(user_id: current_user.id, start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
      @friends_events = Event.where(user_id: friends_ids, private: false, start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
      @private_events = Event.joins(:attendees).where(attendees: { user_id: current_user.id }, private: true)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)

    if @event.save
      redirect_to session.delete(:previous_url), allow_other_host: true || root_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to session.delete(:previous_url), allow_other_host: true || root_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to '/events'
  end

  private

  def friends_ids
    user = User.find(current_user.id)
    user.friends.where(pending: false).pluck(:friend_id) + user.inverse_friends.where(pending: false).pluck(:user_id)
  end

  def event_ids
    JSON.parse(params[:ids])
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :description, :private)
  end


end
