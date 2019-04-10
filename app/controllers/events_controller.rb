class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :destroy, :update]
  before_action :set_user, only: [:show, :edit, :destroy, :update, :index]

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    if @user == @event.user_id
      @user = User.find(@event.user_id)
      @expense = Expense.new
      @expenses = @event.expenses.all
    else
      redirect_to root_path
    end
  end

  def index
    current_user = User.find(@user)
    @events = current_user.events
    redirect_to root_path
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_user
    @user = session[:user_id]
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :budget, :users_id)
  end
end
