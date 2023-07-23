class SessionsController < ApplicationController
  def new; end #replaces user login_form

  def create #replaces user_login action
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password]) #user.password == params[:password]
      session[:user_id] = user.id
      flash[:success]= "Welcome Back #{user.name}!"
    # redirect_to user_path(user)
    if user.admin?
      redirect_to admin_dashboard_path
    elsif user.manager?
      redirect_to root_path
    elsif
      redirect_to root_path
    end
    else
      flash[:error] = "Sorry your email or password is incorrect"
      redirect_to login_path
    end
  end

  def destroy #replaces user_logout action
    session[:user_id] = nil
    # reset_session also works
    redirect_to root_url, notice: "You have successfully logged out."
  end
end