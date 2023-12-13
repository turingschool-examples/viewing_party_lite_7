class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show    
    if current_user
      @movie_info = current_user.my_movies
      if @movie_info != []
        @image = @movie_info.first.image_url
      end
    else
      redirect_to root_path
      flash[:alert] = "You must be logged in or registered to access the dashboard."
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to user_dashboard_path(user)
    else
      flash[:alert] = 'Error: Please fill out all fields and use a unique email'
      render :new
    end
    require 'pry'; binding.pry
  end

  def login_form
  end

  def login_user
    user = User.find_by(name: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_dashboard_path(user)
    elsif !user
      flash[:error] = "We could not find your account. Register an account or try again."
      redirect_to login_path
    elsif params[:password] != user.password
      flash[:error] = "Your password is incorrect. Try again."
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
