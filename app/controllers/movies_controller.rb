class MoviesController < ApplicationController
  def discover
    response = conn.get('/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc')
  end

  def details 
    response = conn.get('https://api.themoviedb.org/3/movie/872585?language=en-US&append_to_response=credits,reviews')

    @movie = 
    @user = User.find(params[:id])
  end
end
