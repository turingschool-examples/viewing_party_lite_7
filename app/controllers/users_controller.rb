# frozen_string_literal: true

class UsersController < ApplicationController
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
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Credentials are incorrect"
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
