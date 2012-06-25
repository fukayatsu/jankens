class HomeController < ApplicationController
  def index
    user_id = session[:user_id]
    redirect_to user_path(user_id) if user_id
  end
end
