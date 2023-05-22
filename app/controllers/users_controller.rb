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
      session[:user_id] = new_user.id
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

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are not valid."
      render :login_form
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end
end