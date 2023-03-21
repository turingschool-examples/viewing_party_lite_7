class UsersController < ApplicationController
  def new

  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else 
      flash[:notice] = "Please fill in all fields"
      render :new
    end
  end
end