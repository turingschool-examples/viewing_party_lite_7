class UsersController < ApplicationController
  before_action :authorization, only: [:show]
  before_action :email_confirmation, only: [:login]

  def show
    # turned the commented out line below into the before action: 
    # if current_user
      @user = current_user
      user_all_parties = @user.parties

      @all_parties_and_movie = []

      user_all_parties.each do |party|
        @all_parties_and_movie << party.get_all_info
      end
    # else
    #   flash[:message] = "You must be logged in or registered to continue."
    #   redirect_to "/"
    # end
  end
  
  def new
    @user = User.new
  end
  
  def create
    new_params = user_params
    new_params[:email] = new_params[:email].downcase
    new_user = User.new(new_params)
    
    if params[:password] == params[:password_confirmation] && new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "#{new_user.name} has been created!"
      # redirect_to "/users/#{new_user.id}"
      redirect_to "/dashboard"
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      # redirect_to register_path
      redirect_to "/register"
    end
  end

  def login_form
  end

  def login
      # if !user.nil? && user.authenticate(params[:password]) #bcrypt gem / if only one error message is ok this will work
      if user.authenticate(params[:password]) #bcrypt gem
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.name}!"
        # redirect_to "/users/#{user.id}"
        redirect_to "/dashboard"
      else
        flash[:message] = "Sorry, your password is incorrect."
        render :login_form
        # redirect_to "/login"
      end
  end

  def email_confirmation
    if user.nil?
      flash[:message] = "Sorry, your email is incorrect."
      render :login_form
    end
  end

  def user
    @user = User.find_by(email: params[:email])
  end
  
  def logout
    session[:user_id] = nil
    flash[:success] = "You've been successfully logged out."
    redirect_to "/"
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
