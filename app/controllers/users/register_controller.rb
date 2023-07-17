class Users::RegisterController < ApplicationController
  def index

  end

  def create
    @user = User.new(email: params[:email], name: params[:name], password_digest: params[:password])
    if @user.save
      redirect_to user_path(@user.id)
    end
  end

  private
    def user_params
    end
end