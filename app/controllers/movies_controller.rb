class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def search
    
  end
end