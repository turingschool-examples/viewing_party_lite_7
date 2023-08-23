class UsersController < ApplicationController
  def index

  end

  def new

  end

  def show
    @user = User.find(params[:id])
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
    params.permit(:name, :email)
  end
end