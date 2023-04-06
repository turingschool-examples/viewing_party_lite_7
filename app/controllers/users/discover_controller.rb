class Users::DiscoverController < ApplicationController
  def index
    @user = User.find(params[:id])
    # @user = current_user # Need to udpate test to include logging in
  end
end