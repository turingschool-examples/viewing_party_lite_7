class MovieFacade
  attr_reader :keyword
  def initialize(params)
    @keyword = params[:keyword]
    @movie_id = params[:id]
  end

  def movies
    if @keyword == "top rated"
      top_movies
    else
      movies_search
    end
  end

  def movie_details
    movie = MovieService.movie_details(@movie_id)
    Movie.new(movie)
  end

  def cast_members
    cast = MovieService.movie_cast(@movie_id)

    x = cast[:cast].first(10).map do |cast_member|
      CastMember.new(cast_member)
    end
  end

  def movie_reviews
    reviews = MovieService.movie_reviews(@movie_id)

    reviews[:results].map do |review|
      Review.new(review)
    end
  end

  def movie_review_count
    movie_reviews.count
  end

  def top_movies
    movies = MovieService.top_movies
    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def movies_search
    movies = MovieService.movies_search(@keyword)
    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_details
    movie = MovieService.movie_details(@movie_id)
    Movie.new(movie)
  end
end