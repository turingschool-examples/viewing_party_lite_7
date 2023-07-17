class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_data = user_params
    user_data[:email] = user_data[:email].downcase
    @user = User.new(user_data)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  def login_form
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
