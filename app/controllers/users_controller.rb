class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end
end