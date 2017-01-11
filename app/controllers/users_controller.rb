class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    find_user
    @review = Review.new
    @all_reviews = @user.received_reviews
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signup_path
    end
  end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    session.clear
    find_user
    destroy_user

    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def destroy_user
    Comment.where(user_id: @user.id).each do |comment|
      comment.destroy
    end
    Review.where(sender_id: @user.id).each do |review|
      review.destroy
    end
    @user.destroy
  end

end
