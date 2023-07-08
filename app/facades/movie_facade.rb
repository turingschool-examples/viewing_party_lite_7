class MovieFacade
  attr_reader :search
  
  def initialize(search = nil)
    @search = search
  end

  def movie(id) 
    movie_details = service.find_movie(id)
    details = movie_data(movie_details)
    Movie.new(details)
  end
  
  def top_movies
    movies = service.top_movies
    create_movies(movies)
  end

  def search_movies
    movies = service.search_movies(search)
    create_movies(movies)
  end

  def cast(movie_id)
    cast = service.movie_cast(movie_id).first(10)
    cast.map do |cast_member|
      CastMember.new(cast_member)
    end
  end

  def reviews(movie_id)
    reviews = service.movie_reviews(movie_id)
    reviews.map do |review|
      Review.new(review)
    end
  end

  def service 
    MovieService.new
  end
  
  def create_movies(movies_data)
    movies_data[:results].map do |data|
      Movie.new(data)
    end
  end

  # private 

  def extract_genres(genres_data)
    genres_data.map do |genre_data|
      genre_data[:name]
    end
  end

  def movie_data(details)
    {
      id: details[:id],
      title: details[:title], 
      genres: extract_genres(details[:genres]), 
      overview: details[:overview], 
      runtime: details[:runtime], 
      vote_average: details[:vote_average]
    }
  end
end