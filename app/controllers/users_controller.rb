class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    elsif user.errors.full_messages.include?("Email has already been taken")
      flash[:alert] = "This email is already taken"
      redirect_to "/register"
    else
      flash[:alert] = "Please fill out all fields"
      redirect_to "/register"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end