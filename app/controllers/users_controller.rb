class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @movie_info = @user.my_movies
    if @movie_info != []
      @image = @movie_info.first.image_url
    else
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_dashboard_path(@user)
    else
      flash[:alert] = 'Error: Please fill out all fields and use a unique email'
      render :new
    end
  end

  def login_form
    
  end

  def login_user
    user = User.find_by(name: params[:username])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_dashboard_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
