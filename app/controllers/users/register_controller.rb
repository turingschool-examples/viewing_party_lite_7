class Users::RegisterController < ApplicationController
  def index

  end

  def create
    @user = User.create(name: params[:name], email: params[:email])
    #make User.new to test if email is unique
    redirect_to user_path(@user.id)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end