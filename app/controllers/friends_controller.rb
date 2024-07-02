class FriendsController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @friends = @user.friends.where(pending: false).map(&:friend) + @user.inverse_friends.where(pending: false).map(&:user)
    @sent_requests = @user.friends.where(pending: true).map(&:friend)
    @recieved_requests = @user.inverse_friends.where(pending: true).map(&:user)
  end

  def send_request
  end

  def accept_request
    @request = Friend.where(user_id: params[:id], friend_id: current_user.id)
    @request.update(pending: false)
    redirect_to '/find_friends'
  end

  def destroy
    @friend = Friend.find_by user_id: params[:id], friend_id: current_user.id
    if @friend
      @friend.destroy
    else
      @friend = Friend.find_by user_id: current_user.id, friend_id: params[:id]
      @friend.destroy
    end
    redirect_to '/find_friends'
  end

end
