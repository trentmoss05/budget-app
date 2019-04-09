class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to user_event_url(@event.user_id, @event)
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

  def index
    current_user = User.find(@user)
    @events = current_user.events
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to user_event_url(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :budget, :users_id)
  end
end
