class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @user = User.find(params[:id])

    @match_count = Challenge.match_count(@user.id)
    @open_count = Challenge.open_count(@user.id)
    @win_count = Challenge.win_count(@user.id)
    @lose_count = Challenge.lose_count(@user.id)
    @draw_count = Challenge.draw_count(@user.id)
    @win_rate = 100.0 * @win_count / @match_count unless @match_count == 0

    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html{redirect_to @user, notice: 'user updated'}
      else
        format.html{render action: "edit"}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
      session[:user_id] = nil
    end

    #ジャンケン情報も削除する
    Challenge.where('to_user_id = ? OR from_user_id = ?',
        @user.id, @user.id).destroy_all

    @user.destroy

    respond_to do |format|
      format.html {redirect_to users_url}
    end
  end
end
