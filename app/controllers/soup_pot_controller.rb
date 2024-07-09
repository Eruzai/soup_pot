class SoupPotController < ApplicationController

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @my_events = Event.where(user_id: current_user.id, start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @friends_events = Event.where(user_id: friends, start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  private

  def friends
    user = User.find(current_user.id)
    user.friends.where(pending: false).pluck(:friend_id) + user.inverse_friends.where(pending: false).pluck(:user_id)
  end
end
