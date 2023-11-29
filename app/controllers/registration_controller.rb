class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "**Email taken. Please enter a different email.**"
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
