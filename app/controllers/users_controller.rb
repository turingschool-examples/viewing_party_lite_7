class UsersController < ApplicationController
  def show
    @facade = UserFacade.new(params[:id])
    # @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
      flash[:success] = 'New account created successfully.'
    else
      flash[:error] = "Please fill out BOTH name and email"
      redirect_to register_path
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
