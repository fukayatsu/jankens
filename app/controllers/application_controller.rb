class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_name

  private
  def current_user
    if session[:user_id]
      user = User.find_by_id(session[:user_id])
      @current_user ||= User.find_by_id(session[:user_id]) if user
    end
  end

  def user_name(user_id)
    user = User.find_by_id(user_id)
    user.name
  end

end
