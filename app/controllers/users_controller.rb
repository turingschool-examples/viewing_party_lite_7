class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    elsif !user.save
      flash[:error] = 'User email already in use, please enter another email'
      redirect_to '/register/new'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
