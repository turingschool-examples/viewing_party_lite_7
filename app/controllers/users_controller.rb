class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
  end
  
  def new
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    else

    end
  end

  def create
    begin
      new_user = User.create!(users_params)
      redirect_to "/users/#{new_user.id}"
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
