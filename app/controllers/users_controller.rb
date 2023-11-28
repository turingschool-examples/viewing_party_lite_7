class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new({name: params[:name], email: params[:email]})
    @user.save
    
    redirect_to "/"
  end
end