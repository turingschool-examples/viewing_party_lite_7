class SessionsController < ApplicationController
  def new

  end

  def create
    begin
      user = User.find_by_email(params[:email])
      raise "Invalid credentials. Please Try again." unless user && user.authenticate(params[:password])
      login(user) # see sessions_helper
      redirect_to user_path(user)
      flash[:success_login] = "Welcome back, #{user.name}"
    rescue StandardError => e
      redirect_to login_path
      flash[:error] = e.message
    end
  end

  def destroy
    log_out # see sessions_helper
    redirect_to root_path
  end
end