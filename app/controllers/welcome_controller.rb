# class WelcomeController < ApplicationController
#   before_action :require_logged_in
#
#   def home
#     @user = User.find(session[:user_id])
#     @events = @user.events.all
#   end
#
#   def expenselist
#     @user = User.find(session[:user_id])
#     @expenses = @user.expenses
#   end
# end
