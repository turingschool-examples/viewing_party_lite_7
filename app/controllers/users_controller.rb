class UsersController < ApplicationController
  def new

  end

  def create

  end

  def dashboard
    @user = User.find(params[:id])
  end
end
