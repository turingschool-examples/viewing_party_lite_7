class MovieFacade
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def movie
    @_movie ||= Movie.new(format_movie_data)
  end

  def poster_path
    "https://image.tmdb.org/t/p/w154#{@movie.poster_path}"
  end
 
  def movie_id
    movie.id
  end

  def movie_title
    movie.title
  end

  def movie_vote_average
    movie.vote_average
  end

  def movie_runtime
    movie.runtime
  end

  def movie_genres
    movie.genres
  end

  def movie_summary
    movie.summary
  end
  
  private
  def format_movie_data
    movie = movie_data
    data = {
      id: movie[:id],
      title: movie[:title],
      vote_average: movie[:vote_average],
      runtime: movie[:runtime],
      genres: get_genres(movie[:genres]),
      summary: movie[:overview],
      poster: create_url(movie[:poster_path])
    }
  end

  def service
    @_service ||= TmdbService.new
  end

  def movie_data
    @_movie_data ||= service.get_movie(@id)
  end

  def reviews_data
    @_reviews_data ||= service.find_reviews(@id)[:results]
  end

  def cast_data
    @_cast_data ||= service.find_cast(@id)[:cast][0..9]
  end

  def get_genres(genres)
    genres.map {|genre| genre[:name]}
  end

  def create_url(path)
    'https://image.tmdb.org/t/p/original' + path
  end
end
