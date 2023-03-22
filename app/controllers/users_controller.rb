class UsersController < ApplicationController
  before_action :find_user, only: [:show, :discover]

  def show
    @user_all_parties = @user.parties
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
  
  def discover
  end

  private
  def user_params
    # params[:email]
    params.permit(:name, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
