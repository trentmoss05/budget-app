class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to users_home_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      return redirect_to root_path
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
