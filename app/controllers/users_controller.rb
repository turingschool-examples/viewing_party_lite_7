class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      flash.notice = 'User has been created!'
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end
  
  private
  def user_params
    params[:email].downcase!
    params.permit(:name, :email)
  end
end