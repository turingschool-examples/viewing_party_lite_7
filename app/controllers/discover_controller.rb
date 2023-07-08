class DiscoverController < ApplicationController
  def discover
    @user = User.find(params[:user_id])

  end
end