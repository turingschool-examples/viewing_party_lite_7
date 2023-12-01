module Users
  class DiscoverController < ApplicationController
    def index
      @user = User.find(params[:id])
    end
  end
end
