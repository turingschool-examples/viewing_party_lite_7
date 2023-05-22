class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)

    if new_user.valid?
      new_user.save
      redirect_to user_path(new_user)
    else
      message = new_user.errors.full_messages.join(", ")
      flash[:error] = message
      redirect_to new_user_path
    end
  end

  def show
    @facade = MovieFacade
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end
end