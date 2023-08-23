# frozen_string_literal: true

class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
end
