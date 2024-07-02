class FriendsController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @friends = @user.friends.where(pending: false).map(&:friend) + @user.inverse_friends.where(pending: false).map(&:user)
    @sent_requests = @user.friends.where(pending: true).map(&:friend)
    @recieved_requests = @user.inverse_friends.where(pending: true).map(&:user)
  end

end
