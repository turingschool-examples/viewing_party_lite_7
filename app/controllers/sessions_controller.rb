class SessionsController < ApplicationController
  def new
    # @user = User.find()
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to user_path(user.id)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end