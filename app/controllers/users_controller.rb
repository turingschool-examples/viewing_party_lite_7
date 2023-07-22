class UsersController < ApplicationController
  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to "/"
      flash[:error] = "Sorry, you must be logged in or registered to access your dashboard."
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to "/register"
      flash[:alert] = "#{user.errors.full_messages.to_sentence}."
    end
  end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
