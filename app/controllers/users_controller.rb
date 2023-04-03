class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
    # @hosting = @user.hosted_parties(params[:id])
    # @invited = @user.invited_parties
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
      flash[:notice] = "User was successfully created"
    else 
      flash[:alert] = @user.errors.full_messages.join(", ")
      redirect_to "/register"
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end