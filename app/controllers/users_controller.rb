# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new 
    # @new_user = User.new
  end

  def create 
    @new_user = User.new(user_attributes)
    if @new_user.save
      redirect_to "/users/#{@new_user.id}"
    else
      redirect_to '/register'
      flash[:error] = error_message(@new_user.errors)
   end  
  end

  private

  def user_attributes 
    params.permit(:name, :email)
  end

end
