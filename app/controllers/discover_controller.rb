# frozen_string_literal: true

class DiscoverController < ApplicationController
  before_action :find_user, only: :index
  
  def index
    @user = User.find(params[:id])
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
