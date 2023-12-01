class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new({name: params[:name], email: params[:email] })

    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash.notice = 'Please Fill in All Fields/Email is already taken'
      redirect_to '/register'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
