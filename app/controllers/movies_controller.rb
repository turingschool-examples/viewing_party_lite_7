class MoviesController < ApplicationController
  def show

  end

  def index
    @user = User.find(params[:id])
  end
end