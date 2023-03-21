class UsersController < ApplicationController
  def new

  end

  def show
  #   # @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
      flash[:notice] = "User was successfully created"
    else 
      flash[:notice] = "Email already exists for a user"
      render :new
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end