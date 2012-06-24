class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @user = User.find(params[:id])
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
    @user.destroy

    respond_to do |format|
      format.html {redirect_to users_url}
    end
  end
end
