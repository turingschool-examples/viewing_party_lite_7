class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(error)
    flash[:error] = "No user with that email found."
    render :login_form
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
  end
  
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = user.errors.full_messages.to_sentence

      redirect_to '/register'
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by!(email: params[:email])

    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.user_name}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Incorrect password."
      render :login_form
    end
  end

  def logout
    reset_session
    flash[:success] = "You have been logged out."
    redirect_to '/'
  end

  private
  def user_params
    params.permit(:user_name, :email, :password, :password_confirmation)
  end
end
