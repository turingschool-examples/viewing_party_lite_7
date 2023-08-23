class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "An account already exists with this email address."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def new_user_params
    params.permit(:name, :email)
  end
end