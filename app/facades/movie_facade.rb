class MovieFacade

  def top_rated_movies
    movies = TmbdService.new.top_rated_movies
    create_movies(movies)
  end

  def search_movies(search)
    movies = TmbdService.new.search_movies(search)
    create_movies(movies)
  end

  def all_movie_data(id)
    movie = find_movie(id)
    reviews = find_reviews(id)[:results]
    cast = find_cast(id)[:cast][0..9]
    combine_data(movie, reviews, cast)
  end

  
  private
  def find_movie(id)
    movie = TmbdService.new.find_movie(id)
  end

  def find_reviews(id)
    reviews = TmbdService.new.find_reviews(id)
  end

  def find_cast(id)
    cast = TmbdService.new.find_cast(id)
  end

  def create_movies(movies)
    movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def create_movie(data)
    Movie.new(data)
  end

  def combine_data(movie, reviews, cast)
    movie_data = {
      id: movie[:id],
      title: movie[:title],
      vote_average: movie[:vote_average],
      runtime: movie[:runtime],
      genres: movie[:genres].map {|genre| genre[:name]},
      summary: movie[:overview],
      poster: 'https://image.tmdb.org/t/p/original' + movie[:poster_path],
      reviews: reviews,
      cast: cast
    }
    create_movie(movie_data)
  end
end