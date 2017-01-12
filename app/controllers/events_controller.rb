class EventsController < ApplicationController
  def show
    find_event
    @all_comments = Comment.where(event_id: @event.id)
    @comment = Comment.new
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.update(creator_id: session[:user_id], start_date: start_date_params, end_date: end_date_params)
      Attendee.create(user_id: current_user.id, event_id: @event.id)
      redirect_to @event
    else
      flash[:message] = @event.errors.full_messages.first
      redirect_to new_event_path
    end
  end

  def edit
    find_event
  end

  def update
    find_event
    @event.update(event_params)
    @event.update(start_date: start_date_params, end_date: end_date_params)

    redirect_to @event
  end

  def destroy
    find_event
    @event.destroy

    @user = User.find(session[:user_id])
    redirect_to user_path(@user)
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
