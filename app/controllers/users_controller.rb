class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def discover
    @user = User.find(params[:id])
  end

  def show
    @facade = UserFacade.new(params[:id])
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      create_welcome(new_user)
    else
      redirect_to register_path
      flash[:error] = new_user.errors.full_messages.to_sentence
    end
  end

  def login_form
  end
  
  def login_user
    user = User.find_by(email: params[:email])
    if user == nil
      redirect_to '/login'
      flash[:error] = "Please enter correct email and password"
    elsif user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user.id)
    else

      redirect_to '/login'
      flash[:error] = "Sorry, your credentials are bad."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create_welcome(new_user)
    flash[:success] = "Welcome, #{new_user.name}!"
    redirect_to user_path(new_user.id)
  end
end