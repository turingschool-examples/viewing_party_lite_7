class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movie_facade = MovieFacade.new(params[:movie])
  end

  def search
    if params[:search].blank?
      redirect_to "/users/#{@user.id}/discover" and return
    else
      movie_search
    end
  end

  # def search
    # if params[:search].blank?
    #   redirect_to "/users/#{@user.id}/discover" and return
    # else
    #   @parameter = params[:search].downcase
    #   @results = Movies.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    # end
  # end


end