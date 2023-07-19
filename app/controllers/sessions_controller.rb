class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def login_user
    user = User.find_by(email: params[:email].downcase)

    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.name}"
        redirect_to user_path(user)
      else
        flash[:error] = "Incorrect Password"
        redirect_to login_path
      end
    else
      flash[:error] = "Email not found"
      redirect_to login_path
    end
  end
end