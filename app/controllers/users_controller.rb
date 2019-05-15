class UsersController < ApplicationController

  before_action :require_logged_in, only: [:home]

  def new
    if logged_in?
      redirect_to users_home_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    @errors = @user.errors.full_messages
    if @user.save
      session[:user_id] = @user.id
      return redirect_to root_path
    else
      render :new, flash: {alert: @user.errors.full_messages}
    end
  end

  def show
    @user = User.find(session[:user_id])
    render json: @user
  end

  def home
    @user = User.find(session[:user_id])
    @events = @user.events.all
  end

  def expenselist
    @user = User.find(session[:user_id])
    @expenses = @user.expenses

    render json: @expenses, status: 200

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
