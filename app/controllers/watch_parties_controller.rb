class WatchPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
  end
end