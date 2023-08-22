class UsersController < ApplicationController
  def index

  end

  def new

  end

  def show
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User Created Successfully"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email)
  end
end