class FriendsController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @friends = @user.friends.where(pending: false).map(&:friend) + @user.inverse_friends.where(pending: false).map(&:user)
    @sent_requests = @user.friends.where(pending: true).map(&:friend)
    @recieved_requests = @user.inverse_friends.where(pending: true).map(&:user)
  end

  def search
    @search_results = User.where(search_query).limit(15)
    @user = User.find(current_user.id)
    @friends = @user.friends.where(pending: false).map(&:friend) + @user.inverse_friends.where(pending: false).map(&:user)
    @sent_requests = @user.friends.where(pending: true).map(&:friend)
    @recieved_requests = @user.inverse_friends.where(pending: true).map(&:user)
    render :show
  end

  def send_request
    @user = User.find(current_user.id)
    @request = @user.friends.create(friend_id: params[:id])
    redirect_to '/find_friends'
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

  private

  def search_params
    params.permit(
      :first_name,
      :last_name
    )
  end

  def search_query
    if !params[:last_name].present?
      ["first_name LIKE ?", "%#{search_params[:first_name]}%"]
    elsif !params[:first_name].present?
      ["last_name LIKE ?", "%#{search_params[:last_name]}%"]
    else
      ["first_name LIKE ? OR last_name LIKE ?", "%#{search_params[:first_name]}%", "%#{search_params[:last_name]}%"]
    end
  end

end
