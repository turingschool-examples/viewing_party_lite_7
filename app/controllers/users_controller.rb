class UsersController < ApplicationController
  def index
  end

  def show
    require 'pry'; binding.pry
    @user = User.find(params[:id])
  end
end
