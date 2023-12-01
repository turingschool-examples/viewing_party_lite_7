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
        end
        redirect_back(fallback_location: new_user_path)
      end
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end 
end
