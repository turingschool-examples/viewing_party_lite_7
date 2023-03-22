class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_all_parties = @user.parties
  end

  def create

  end
end
