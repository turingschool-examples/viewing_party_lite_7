class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)

    if new_user.valid?
      new_user.save
      session[:user_id] = new_user.id
      redirect_to user_path(new_user)
    else
      message = new_user.errors.full_messages.join(", ")
      flash[:error] = message
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @user = current_user
      @facade = MovieFacade
    else
      flash[:error] = "You must be logged in or registered to access your dashboard."
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end