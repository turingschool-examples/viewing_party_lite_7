class MoviesFacade
  attr_reader :movie_id,
              :movie_title,
              :top_movies,
              :user

  def initialize(movie_params)
    @movie_id = movie_params[:id]
    @movie_title = movie_params[:title]
    @top_movies = movie_params[:top_movies]
    @user = User.find(movie_params[:user_id])
  end

  def discover_options
    if @top_movies
      top_movie_info = ThemoviedbService.new.top_movies.map do |movie|
        MovieDetails.new(movie)
      end
    elsif @movie_title != nil
      searched_movies = ThemoviedbService.new.movie_titles(@movie_title)
      searched_movies.map do |movie|
        MovieDetails.new(movie)
      end
    end
  end

  def header
    if @top_movies
      "Top Movies"
    elsif @movie_title != nil
      "Search Results"
    end
  end

  def movie_details
    movie_info = ThemoviedbService.new.movie_details(@movie_id)
    MovieDetails.new(movie_info)
  end

  def movie_credits
    movie_info = ThemoviedbService.new.movie_credits(@movie_id)
    MovieCredits.new(movie_info)
  end

  def movie_reviews
    movie_info = ThemoviedbService.new.movie_reviews(@movie_id)
    MovieReviews.new(movie_info)
  end
end