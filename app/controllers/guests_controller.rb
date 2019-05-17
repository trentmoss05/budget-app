class GuestsController < ApplicationController
  before_action :set_user, only: [:destroy, :create]
  before_action :set_guest, only: [:destroy]

  def create
    if params[:user_id] = session[:user_id]
      @event = Event.find(params[:guest][:event_id])
      @guest = @event.guests.build(guest_params)
      @guest.save
      render json: @guest
    else
      redirect_to root_path
    end
  end

  def destroy
    if params[:user_id] = session[:user_id]
      @event = @guest.event_id
      @guest.destroy
      redirect_to event_path(@event)
    else
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = session[:user_id]
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:name, :event_id)
  end

end
