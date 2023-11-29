class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end
end
