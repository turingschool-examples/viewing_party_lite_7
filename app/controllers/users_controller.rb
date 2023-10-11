class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      flash[:alert] = "Unable to register. Please use a unique email address."
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end