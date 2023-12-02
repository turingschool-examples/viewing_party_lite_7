class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(params[:name])
    if user && user.password == (params[:password])
      session[:email] = user.id
      flash[:notice]="Login successful"
      redirect_to '/'
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:name] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end
end
