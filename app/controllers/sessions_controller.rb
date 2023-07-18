class SessionsController < ApplicationController
  def landing
    @users = User.all
  end

  
  def new
  end
  
  def create
    if params[:password] != params[:password_confirmation]
      flash[:error] = "Invalid email or password"
      redirect_to new_session_path
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.name}, you have sucussfully registered"
        redirect_to user_path(@user.id)
      else
        flash[:error] = "Invalid email or password"
        redirect_to new_session_path
      end
    end
  end
  
  def login_form
  end
  
  def login
    if params[:email] == ""
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    else
      @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.name}!"
        redirect_to user_path(@user.id)
      else
        flash[:error] = "Invalid email or password"
        redirect_to login_path
      end
    end
  end

  def destroy
  end

  def Logout
  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end
end