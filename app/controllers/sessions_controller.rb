class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are not valid."
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have been successfully logged out."
    redirect_to root_path
  end
end