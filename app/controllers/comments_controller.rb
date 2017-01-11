class CommentsController < ApplicationController
  def index
  end

  def create
    @event = Event.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.update(user_id: current_user.id, event_id: @event.id)

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy

    redirect_to event_path(@event)
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
