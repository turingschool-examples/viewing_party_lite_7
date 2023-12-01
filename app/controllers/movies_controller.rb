class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = PreviewFacade.discover_results
  end
end
