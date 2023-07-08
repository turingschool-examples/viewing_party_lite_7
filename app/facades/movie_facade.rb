class MovieFacade
  attr_reader :user_id

  def initialize(params)
    @movie_id = params[:id]
    @user_id = params[:user_id]
    @commit = params[:commit]
    @title = params[:search]
  end

  def user
    @_user ||= User.find(@user_id)
  end

  def movies
    if @commit == "Find Movies"
      movie_search(@title)
    else
      top_rated_movies
    end
  end

  def top_rated_movies
    MovieService.top_rated_movies[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_search(search)
    MovieService.movie_search(search)[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_details
    Movie.new(find_by_id(@movie_id))
  end

  def movie_title
    movie_details.title
  end

  def find_by_id(movie_id)
    results = MovieService.find_by_id(movie_id)
  end
end
