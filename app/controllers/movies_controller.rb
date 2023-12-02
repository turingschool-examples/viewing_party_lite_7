class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = PreviewFacade.new(params[:query]).movie_previews
  end
end
