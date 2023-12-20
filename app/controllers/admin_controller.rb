class AdminController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    unless @user.admin?
      redirect_to "/"
      flash[:notice] = "You are not authorized to access that page"
    end
    @users = User.all

  end
end