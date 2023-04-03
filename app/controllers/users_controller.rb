class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @viewing_parties = ViewingParties.where("viewing_parties.id = #{@user.id}")
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_attributes)
    if params[:password] != params[:password_confirmation] 
      redirect_to "/register"
      flash[:error] = "Passwords do not match"
    elsif @new_user.save
      redirect_to "/users/#{@new_user.id}"
    else
      redirect_to "/register"
      flash[:error] = error_message(@new_user.errors)
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  private

  def user_attributes
    params.permit(:name, :email, :password)
  end
end
