class SessionController < ApplicationController
  # login & logout actions should not require user to be logged in
  skip_before_filter :set_current_user
  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.info auth
    Rails.logger.info 'Auth[uid] = '+auth["uid"]
    user =
      Moviegoer.where(uid: auth["uid"]).first ||
      Moviegoer.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to movies_path
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path
  end
  def fail
    raise StandardError.new(ENV["omniauth.auth"])
  end

  def login
    render '/login/index'
  end
end