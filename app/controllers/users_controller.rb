class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hosted_parties = ViewingParty.where(:user_id == @user.id)
    @details = TmdbFacade.new
  end

  def new; end

  def discover
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      redirect_to register_path
      flash[:alert] = 'Email is not unique or form is not fully complete or passwords do not match'
    end
  end

  def login_form
  end
 
  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = 'Invalid Credentials'
      redirect_to login_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
