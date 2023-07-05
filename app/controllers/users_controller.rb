class UsersController < ApplicationController
  def show

  end

  def new
    
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      redirect_to register_path
      flash[:alert] = 'Email is not unique or form is not fully complete'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
