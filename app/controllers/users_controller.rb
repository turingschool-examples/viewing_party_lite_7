class UsersController < ApplicationController
  # before_action :require_user, only: [:show, "/dashboard"]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password == params[:user][:password_confirmation]
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "User successfully created"
        redirect_to "/users/#{@user.id}"
      else
        flash[:error] = error_message(@user.errors)
        redirect_to "/register"
      end
    else
      flash[:error] = "Password confirmation doesn't match Password"
      redirect_to "/register"
    end
  end

  def show
    @user = current_user
    if @user
      @user_viewing_parties = @user.parties
      require 'pry'; binding.pry
      @movie_facade = MovieFacade.new
    else
      flash[:error] = "You must be logged in to view this page!"
      redirect_to root_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:notice] = "Invalid Credentials"
      redirect_to '/login'
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = "Invalid Credentials"
      redirect_to '/login'
    end
  end

  def logout
    session.delete(:user_id)
    flash[:message] = "You have been logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
