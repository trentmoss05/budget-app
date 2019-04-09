class ExpensesController < ApplicationController
  def edit
  end

  def update
    if params[:user_id] = session[:user_id]
      if @expense.update(expense_params)
        redirect_to event_path(@expense.event.id)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def create
    if params[:user_id] = session[:user_id]
      @event = Event.find(params[:expense][:event_id])
      @expense = @event.expenses.build(expense_params)
      @expense.save
    else
      redirect_to root_path
    end
  end

  def destroy
    if params[:user_id] = session[:user_id]
      @event = @expense.event_id
      @expense.destroy
      redirect_to events_path(@event)
    else
      redirect_to root_path
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :cost, :quantity, :event_id)
  end
end
