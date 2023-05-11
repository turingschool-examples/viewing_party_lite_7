class MovieFacade

  def self.top_rated_movies
    movies = TmbdService.top_rated_movies
    create_movies(movies)
  end

  def self.search_movies(search)
    movies = TmbdService.search_movies(search)
    create_movies(movies)
  end

  def self.all_movie_data(id)
    movie = find_movie(id)
    reviews = find_reviews(id)[:results]
    cast = find_cast(id)[:cast][0..9]
    combine_data(movie, reviews, cast)
  end

  
  private
  def self.find_movie(id)
    movie = TmbdService.find_movie(id)
    # create_movie(movie)
  end

  def self.find_reviews(id)
    reviews = TmbdService.find_reviews(id)
  end

  def self.find_cast(id)
    cast = TmbdService.find_cast(id)
  end
  
  def self.create_movies(movies)
    movies[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.create_movie(data)
    Movie.new(data)
  end

  def self.combine_data(movie, reviews, cast)
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