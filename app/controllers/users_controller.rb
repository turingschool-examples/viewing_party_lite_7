class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new 

  end
  
  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to user_path(@new_user)
    else
      flash.notice = "Oops, please try again your email is not unique."
      render 'new'
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
