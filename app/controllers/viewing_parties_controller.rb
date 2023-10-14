class ViewingPartiesController < ApplicationController 
  def new
    @user = User.find_by_id(session[:user_id])
    @users = User.all
    id = params[:id]
    @movie = MovieFacade.find_by_id(params[:id])
  end

  def create
    @user = User.find_by_id(session[:user_id])
    # if params[:duration].present? && params[:start_time].present? && params[:movie_id].present?
    #   @user.viewingparty.create(movie_title: params[:name]
    #   description:params[:description]
      
    # end
  end
end