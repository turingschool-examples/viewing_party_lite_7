class AdminController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @users = User.all
  end
end