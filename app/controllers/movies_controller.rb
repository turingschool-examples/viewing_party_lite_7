class MoviesController < ApplicationController
  before_action :get_user
  
  def index
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end
end
