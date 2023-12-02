class SessionsController < ApplicationController
  def new
  end

  def create
    if User.where(name: params[:name]) != []
      user = User.where(name: params[:name]).first
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice]="Login successful"
        redirect_to '/'
      else
        flash[:notice]="Invalid name or Password"
        redirect_to '/login'
      end
    else
      flash[:notice]="Invalid name or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:name] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end
end
