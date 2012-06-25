# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_name, :janken_name, :twitter_id, :user_of

  private
  def current_user
    if session[:user_id]
      user = User.find_by_id(session[:user_id])
      @current_user ||= User.find_by_id(session[:user_id]) if user
    end
  end

  private
  def user_of(user_id)
    User.find_by_id(user_id)
  end

  # TODO　廃止
  private
  def user_name(user_id)
    user = User.find_by_id(user_id)
    user.name
  end

  private
  def twitter_id(user_id)
    user = User.find_by_id(user_id)
    user.twitter_id
  end

  # TODO 適切な場所に移動
  private
  def janken_name(choise)
    case choise
    when 0
      "グー"
    when 1
      "チョキ"
    when 2
      "パー"
    else
      "ほあちゃー"
    end
  end

end
