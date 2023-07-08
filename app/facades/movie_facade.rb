class MovieFacade
  attr_reader :search
  
  def initialize(search = nil)
    @search = search
  end

  def movie(id) 
    movie_details = service.find_movie(id)
    movie_data = {
      id: movie_details[:id],
      title: movie_details[:title], 
      genres: extract_genres(movie_details[:genres])
    }
    Movie.new(movie_details)
  end
  
  def top_movies
    movies = service.top_movies
    create_movies(movies)
  end

  def search_movies
    movies = service.search_movies(search)
    create_movies(movies)
  end

  def service 
    MovieService.new
  end
  
  def create_movies(movies_data)
    movies_data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def extract_genres(genres_data)
    genres_data.map do |genre_data|
      genre_data[:name]
    end
  end
end