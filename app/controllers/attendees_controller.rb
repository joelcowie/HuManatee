class AttendeesController < ApplicationController
  def index
    @roster = Attendee.where(event_id: params[:id])
    @attendees = User.where(id: @roster.pluck(:user_id))
  end

  def create
    @event = Event.find(params[:id])
    @attendee = Attendee.create(event_id: params[:id], user_id: session[:user_id])

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @attendee = Attendee.find_by(user_id: session[:user_id], event_id: params[:id])
    @attendee.destroy

    redirect_to event_path(@event)
  end
end
