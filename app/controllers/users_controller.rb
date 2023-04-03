class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    user_all_parties = @user.parties

    @all_parties_and_movie = []

    user_all_parties.each do |party|
      @all_parties_and_movie << party.get_all_info
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    new_params = user_params
    new_params[:email] = new_params[:email].downcase
    new_user = User.new(new_params)
    
    if new_user.save
      # session[:user_id] = new_user.id
      flash[:success] = "#{new_user.name} has been created!"
      redirect_to "/users/#{new_user.id}"
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      # redirect_to register_path
      redirect_to "/register"
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      # session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"

    else
      flash[:message] = "Sorry, your credentials are bad."
      render :login_form
      # redirect_to "/login"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
