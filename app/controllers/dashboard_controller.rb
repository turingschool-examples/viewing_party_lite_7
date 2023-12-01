class DashboardController < ApplicationController
  def show
    @primary = User.find(params[:user_id])
    @viewed = User.find(params[:id])
  end
end