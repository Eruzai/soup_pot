class AttendeesController < ApplicationController

  before_action :store_previous_url

  def store_previous_url
    session[:previous_url] = request.referer if request.referer
  end

  def send_invite
    @invite = Attendee.create(send_invite_params)

    if @invite.save
      redirect_to session.delete(:previous_url), allow_other_host: true || root_path
    end
  end

  # def accept_invite
  #   @attendee = Attendee.where (user_id: params[:friend_id], event_id: params[:event_id])
  #   @attendee.update(attending: true)
  # end

  # def remove_attendee
  #   @attendee = Attendee.where (user_id: params[:friend_id], event_id: params[:event_id])
  #   @attendee.destroy
  # end

  private

  def send_invite_params
    params.permit(
      :friend_id,
      :event_id
    )
    return{
      user_id: params[:friend_id],
      event_id: params[:event_id].keys.join(""),
      attending: false
    }
  end

end
