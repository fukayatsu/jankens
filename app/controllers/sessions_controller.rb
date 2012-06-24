class SessionsController < ApplicationController
	def create
    auth = request.env["omniauth.auth"]

    raise "support only twitter now " unless(auth["provider"] == "twitter")

    user = User.find_by_twitter_id(auth["uid"]) || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, :notice => "log in"
	end

	def destroy
		session[:user_id] = nil
        redirect_to root_url, :notice => "log out"
	end
end
