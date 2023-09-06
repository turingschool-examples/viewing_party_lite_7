class UsersController < ApplicationController
  def show
    begin
      @user = User.find(params[:id])
      raise "Please log in or register to view this page" unless logged_in?
      @facade = MoviePartyFacade.new
    rescue StandardError => e
      redirect_to root_path
      flash[:error] = e.message
    end
  end

  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      login(user) #see SessionHelper
      redirect_to user_path(user)
      flash[:success_login] = "New account created successfully."
    else 
      flash[:error] = "#{error_message(user.errors)}"
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
end