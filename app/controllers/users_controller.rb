class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to '/register'
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