class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user.id)
    else
      flash[:error] = "'Name' and 'Email' fields are required, please try again."
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
