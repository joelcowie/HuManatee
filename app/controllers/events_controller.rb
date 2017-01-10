class EventsController < ApplicationController
  def show
    find_event
    @organizer = User.find(@event.creator_id)
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = session[:user_id]
    @event.start_date = start_date_params
    @event.end_date = end_date_params
    @event.save
    redirect_to @event
  end

  def edit
    find_event
  end

  def update
    find_event
    @event.update(event_params)

    redirect_to @event
  end

  def destroy
    find_event
    @event.destroy

    redirect_to events_path
    #redirect_to user homepage
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def start_date_params
    "#{params[:event]['start_date(3i)']}-#{params[:event]['start_date(2i)']}-#{params[:event]['start_date(1i)']} #{params[:event]['start_date(4i)']}:#{params[:event]['start_date(5i)']}"
  end

  def end_date_params
    "#{params[:event]['end_date(3i)']}-#{params[:event]['end_date(2i)']}-#{params[:event]['end_date(1i)']} #{params[:event]['end_date(4i)']}:#{params[:event]['end_date(5i)']}"
  end
end
