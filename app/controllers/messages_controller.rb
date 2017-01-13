class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def new
    @receiver = User.find(params[:id])
    @message = Message.new
  end

  def create
    @receiver = User.find(params[:id])
    @message = Message.new(message_params)
    @message.update(sender_id: current_user.id, receiver_id: @receiver.id)

    redirect_to user_path(@receiver)
  end

  private

  def message_params
    params.require(:message).permit(:description)
  end
end
