class AttendeesController < ApplicationController
  def index
    @roster = Attendee.where(event_id: params[:id])
    @attendees = User.where(id: @roster.pluck(:user_id))
  end

  def create
    @event = Event.find(params[:id])
    @attendee = Attendee.create(event_id: params[:id], user_id: session[:user_id])

    render :'events/show'
  end

  def destroy
    @event = Event.find(params[:id])
    @attendee = Attendee.find_by(user_id: session[:user_id], event_id: params[:id])
    @attendee.destroy

    render :'events/show'
  end
end
