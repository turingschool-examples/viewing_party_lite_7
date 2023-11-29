class UsersController < ApplicationController
  def new; end

  def create
    new_user = User.create(
      name: params[:name],
      email: params[:email]
    )
    if new_user.valid?
      redirect_to "/users/#{new_user.id}"
    else
      flash[:alert] = 'Error: Email already in use!'
      redirect_back(fallback_location: '/')
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
