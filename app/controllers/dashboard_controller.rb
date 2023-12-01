class DashboardController < ApplicationController
  def show
    @primary = User.find(params[:user_id])
    # user who is viewing the user's dashobard
    @viewed = User.find(params[:id])
    # user whose dashboard is being viewed
    @user_parties = @viewed.user_parties
  end
end