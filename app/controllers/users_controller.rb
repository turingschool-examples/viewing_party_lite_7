class UsersController < ApplicationController

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:notice] = "You must be logged in or registered to access your dashboard"
      redirect_to "/"
    end
  end
  
  def new
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/dashboard"
    else
      flash[:error] = "You have entered the incorrect credentials"
      render :login_form
    end
  end

  def log_out_user
    user = User.find(session[:user_id])
    session[:user_id] = nil
    redirect_to "/"
  end

  def create
    begin
      new_user = User.create!(users_params)
      session[:user_id] = new_user.id
      redirect_to "/dashboard"
    rescue ActiveRecord::RecordInvalid => exception
      flash[:notice] = "#{exception.message}"
      redirect_to "/register"
    end
  end

  private
  def users_params
    params.permit(:email, :name, :password, :password_confirmation)
  end

end
