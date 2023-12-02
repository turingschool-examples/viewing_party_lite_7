class MoviesController < ApplicationController
  def discover
    response = conn.get('/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc')
  end

  def show 
    response = conn.get('https://api.themoviedb.org/3/movie/872585?language=en-US&append_to_response=credits,reviews')

    @movie = MovieFacade.get_movie(params[:movie_id])
    @cast = MovieFacade.get_cast(params[:movie_id])
    @reviews = MovieFacade.get_reviews(params[:movie_id])
    @review_count = MovieFacade.count_reviews(params[:movie_id])
    # @user = User.find(params[:id])
    # require 'pry'; binding.pry
  end
end
