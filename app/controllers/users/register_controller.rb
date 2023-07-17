class Users::RegisterController < ApplicationController
  def index
  end

  def create
    if params[:password] != params[:password_confirmation]
      flash[:error] = "Invalid email or password"
      redirect_to users_register_index_path
    else
      @user = User.new(name: params[:name], email: params[:email], password_digest: params[:password])
      if @user.save
        flash[:success] = "Welcome #{@user.name}, you have sucussfully registered"
        redirect_to user_path(@user.id)
      else
        flash[:error] = "Invalid email or password"
        redirect_to users_register_index_path
      end
    end
  end

  private
    # def user_params
    #   params.permit(:email, :name)
    # end
end