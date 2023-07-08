class MovieFacade
  def initialize(id)
    @id = id
  end

  def self.get_movie_poster(id)
    facade = create_facade(id)
    facade.movie.poster
  end

  def self.get_movie_title(id)
    facade = create_facade(id)
    facade.movie.title
  end

  def self.create_facade(id)
    MovieFacade.new(id)
  end

  def movie_id
    movie.id
  end

  def movie_title
    movie.title
  end

  def vote_average
    movie.vote_average
  end

  def runtime
    movie.runtime
  end

  def genres
    movie.genres
  end

  def summary
    movie.summary
  end

  def poster
    movie.poster
  end

  def movie
    Movie.new(movie_attributes)
  end

  def reviews
    reviews_attributes.map do |review|
      Review.new(review)
    end
  end

  def cast
    cast_attributes.take(10).map do |cast|
      Cast.new(cast)
    end
  end

  private

  def movie_attributes
    @_movie ||= service.movie_details(@id)

    {
      id: @_movie[:id],
      title: @_movie[:title],
      vote_average: @_movie[:vote_average],
      runtime: @_movie[:runtime],
      genres: genre_names(@_movie[:genres]),
      overview: @_movie[:overview],
      poster_path: poster_url(@_movie[:poster_path])
    }
  end

  def poster_url(path)
    "https://image.tmdb.org/t/p/original#{path}"
  end

  def genre_names(genres)
    genres.map do |genre|
      genre[:name]
    end.join(", ")
  end

  def reviews_attributes
    service.movie_reviews(@id)[:results]
  end

  def cast_attributes
    service.movie_cast(@id)[:cast]
  end

  def service
    @service ||= MovieService.new
  end
end
