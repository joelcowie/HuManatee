class EventsController < ApplicationController
  def show
    find_event
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
end
