class AttendeesController < ApplicationController
  def index
    @roster = Attendee.where(event_id: params[:id])
    @attendees = User.where(id: @roster.pluck(:user_id))
  end

  def create
    @attendee = Attendee.create(event_id: params[:id], user_id: session[:user_id])

    redirect_to event_path(params[:id])
  end

  def destroy
    @attendee = Attendee.find_by(user_id: session[:user_id], event_id: params[:id])
    @attendee.destroy

    redirect_to event_path(params[:id])
  end
end
