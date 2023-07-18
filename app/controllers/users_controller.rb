class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_data = user_params
    user_data[:email] = user_data[:email].downcase
    @user = User.new(user_data)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  def login_form
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

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
