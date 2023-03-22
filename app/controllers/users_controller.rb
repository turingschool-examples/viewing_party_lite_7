class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_all_parites = @user.parties
    require 'pry'; binding.pry
  end

  def create

  end
end