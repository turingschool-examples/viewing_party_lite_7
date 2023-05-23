class UsersController < ApplicationController
  before_action :user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(strong_params)
    if user.save
      # require 'pry'; binding.pry
    session[:user_id] = user.id
    flash[:success] = "Welcome, #{user.name}!"
    redirect_to user_dashboard_path(user)
    else
      flash[:alert] = 'Invalid credentials, please try again'
      redirect_to register_path
    end
    # if user.save
    #   redirect_to user_dashboard_path(user)
    # else
    #   flash[:alert] = 'Please fill in all fields, email must be unique, and passwords must match'
    #   # flash[:alert] = user.errors.full_messages.to_sentence <possible refactor>
    #   redirect_to register_path
    # end
  end

  def logout_session
  #   user = User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if !user.nil?
      if
        user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.name}!"
        redirect_to user_dashboard_path(user)
      else
        flash[:error] = 'Sorry, your credentials are bad.'
        render :login_form
      end
    else
      flash[:error] = 'Sorry, your credentials are bad.'
      render :login_form
    end
  end

  def show
    @facade = MovieFacade.new(user: user, type: :viewing_parties)
  end

  private

  def user
    User.find(params[:id])
  end

  def strong_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
