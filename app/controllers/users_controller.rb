class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
    # @hosting = @user.hosted_parties(params[:id])
    # @invited = @user.invited_parties
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "User was successfully created"
      redirect_to "/users/#{user.id}"
    else 
      flash[:alert] = user.errors.full_messages.join(", ")
      redirect_to "/register"
    end
  end

  def login_form    
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.role = 1
      if user.logged_in?
        flash[:success] = "Welcome, #{user.name}!"
        redirect_to "/users/#{user.id}"
      else user.logged_out?
        redirect_to "/"
      end
    else flash[:error] = "Invalid Credentials"
      redirect_to "/login"
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end