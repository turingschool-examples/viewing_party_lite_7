class RegisterController < ApplicationController
  def index

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