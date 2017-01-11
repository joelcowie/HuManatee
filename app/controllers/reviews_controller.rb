class ReviewsController < ApplicationController

  def index
  end

  def create
    @user = User.find(params[:id])
    @review = Review.new(review_params)
    @review.update(sender_id: current_user.id, receiver_id: @user.id)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @review = Review.find(params[:review_id])
    @review.destroy

    redirect_to user_path(@user)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
