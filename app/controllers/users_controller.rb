class UsersController < ApplicationController
  def new 
  end

  def dashboard
    @user = User.find(params[:id])
    @parties = @user.matched_parties
    @all_user_parties_host = @user.get_host_parties
  end

  def discover
    @user = User.find(params[:id])
  end
end