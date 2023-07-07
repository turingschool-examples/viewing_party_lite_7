class DiscoverController < ApplicationController
  def discover
    # @facade = SearchFacade.new(params[:movie])
    @user = User.find(params[:user_id])
  end
end