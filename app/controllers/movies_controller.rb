class MoviesController < ApplicationController
  def index
    @users = User.all #find specific user?
    @user = User.find(params[:user_id])
    if params[:search].present?
      @facade = SearchByKeywordFacade.new(params[:search])
    else
      @facade = PopularFacade.new
    end
  end

  def show
    @facade = SearchFacade.new(params[:id])
  end
end