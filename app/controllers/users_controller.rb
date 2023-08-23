class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    # @user = User.find(params[:id])
  end

  # def create
  #   User.create!(new_user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     flash[:notice] = "Data Invalid"
  #     render :new
  #   end
  # end

  def create
    user = User.new(new_user_params)
    if user.save
      redirect_to user_path(user)
    else 
      flash[:error] = "Data Invalid"
      render :new
    end
  end

  private

  def new_user_params
    params.permit(:name, :email)
  end
end
