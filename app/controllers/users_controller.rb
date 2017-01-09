class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    find_user
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
    find_user
    @user.destroy

    redirect_to '/'
    # redirect_to login
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
