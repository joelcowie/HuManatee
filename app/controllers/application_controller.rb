class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    !session[:user_id].blank?
  end

end
