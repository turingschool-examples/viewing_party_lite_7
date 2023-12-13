class Admin::UsersController < ApplicationController

  def show
    if session[:user_id]
      @user = User.find(params[:user_id])
    else
      flash[:notice] = "You must be logged in or registered to access your dashboard"
      redirect_to "/"
    end
  end
  
end