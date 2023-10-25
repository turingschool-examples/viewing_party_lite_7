# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  before_action :require_correct_user, only: [:show]

  def new
  end

  def show
    @facade = UsersFacade.new(params)
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to user_path(new_user.id)
    else
      redirect_to '/register'
      flash[:error] = new_user.errors.full_messages.to_sentence
    end
  end

  def login_form

  end

  def login
    user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Credentials are incorrect"
      redirect_to '/login'
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
  
  def require_logged_in
    flash[:error] = "You must be logged in or registered to access your dashboard"
    redirect_to "/" unless current_user
  end

  def require_correct_user
    render file: "public/404.html" unless params[:id].to_i == current_user.id
  end
end
