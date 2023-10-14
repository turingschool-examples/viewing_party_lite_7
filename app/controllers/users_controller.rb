class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    session[:user_id] = @user.id
  end

  def new

  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
end
