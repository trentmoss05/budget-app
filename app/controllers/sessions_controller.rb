class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if request.env["omniauth.auth"]
      oauth_username = request.env["omniauth.auth"]["info"]["nickname"]
      @user = User.find_or_create_by(username: oauth_username) do |u|
        u.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to root_path
    else
    flash[:password] = "Please enter a password" if params[:user][:password] == ""
    flash[:username] = "Please enter a username" if params[:user][:username] == ""
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:incorrect] = "Incorrect Password" if params[:user][:password] != ""
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
