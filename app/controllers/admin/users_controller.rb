class Admin::UsersController < ApplicationController

  def show
    if session[:user_id]
      @user = User.find(params[:user_id])
      unless User.find(session[:user_id]).admin?
        redirect_to "/"
        flash[:notice] = "You are not authorized to access that page"
      end
    else
      flash[:notice] = "You must be logged in or registered to access your dashboard"
      redirect_to "/"
    end
  end
end