class MovieFacade
  def initialize(movie)
    @movie = movie
  end

  def cast_members
    json = service.get_cast_members(@movie)

    movie_cast = json[:cast].map do |cast_data|
      CastMember.new(cast_data)
    end.first(10)
  end

  def movie
    json = service.get_movie(@movie)

    movie = Movie.new(json)
  end

  def reviews
    json = service.get_reviews(@movie)
    movie_reviews = json[:results].map do |review_data|
      Review.new(review_data)
    end
  end

  def top_20_movies
    json = service.get_top_movies

    movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end.first(20)
  end

  def searched_movies(query)
    json = service.get_searched_movies(query)

    movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end.first(20)
  end

  def service
    MovieService.new
  end
end
