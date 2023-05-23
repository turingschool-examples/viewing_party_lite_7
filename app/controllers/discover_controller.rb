class DiscoverController < ApplicationController
  before_action :user
  def index
    # require 'pry'; binding.pry
    current_user
  end

  private
    def user
      @user = current_user
    end
end
