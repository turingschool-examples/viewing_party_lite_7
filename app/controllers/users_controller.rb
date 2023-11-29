class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.create(user_params)
  end
  
  def create
    @user = User.new(user_params)
  
    if @user.name.blank? || @user.email.blank?
      flash[:alert] = 'Name or Email cannot be blank'
      redirect_back(fallback_location: new_user_path)
    else
      begin
        @user.save!
        redirect_to user_path(@user.id)
      rescue ActiveRecord::RecordNotUnique => e
        if e.message.include?('email')
          flash[:alert] = 'Email is already taken. Please choose a different one.'
        else
          flash[:alert] = 'An error occurred while creating the user.'
        end
        redirect_back(fallback_location: new_user_path)
      end
    end
  end
  
  
  # def create
  #   @user = User.new(user_params)
  #   require 'pry'; binding.pry
  #   if @user.save
  #     redirect_to user_path(@user.id)
  #   else
  #     if @user.errors[:email]
  #       flash[:alert] = "Email has already been taken. Please choose a different email."
  #     else
  #       flash[:alert] = "Name or Email cannot be blank"
  #     end
  #     redirect_back(fallback_location: new_user_path)
  #   end
  # end

  private
  def user_params
    params.permit(:name, :email)
  end 
end