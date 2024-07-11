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

  def accept_invite
    @attendee = Attendee.find_by(accept_invite_params)
    if @attendee.present?
      @attendee.update(attending: true)
    else
      @attendee = Attendee.create(attend_event_params)
    end

    if @attendee.save
      redirect_to session.delete(:previous_url), allow_other_host: true || root_path
    end
  end

  def remove_attendee
    @attendee = Attendee.find_by(remove_attendee_params)
    @attendee.destroy

    if @attendee.destroy
      redirect_to session.delete(:previous_url), allow_other_host: true || root_path
    end
  end

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

  def remove_attendee_params
    params.permit(
      :user_id,
      :event_id
    )
  end

  def accept_invite_params
    params.permit(
      :user_id,
      :event_id
    )
  end

  def attend_event_params
    params.permit(
      :user_id,
      :event_id,
    )
    return {
      user_id: params[:user_id],
      event_id: params[:event_id],
      attending: true
    }
  end

end
