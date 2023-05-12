class MoviesFacade
  # def initialize(title)
  #   @query = query
  #   @id = id
  # end

  def top_rated_movies
    service = MoviesService.new

    json = service.top_rated_movies

    @movies = json[:results][0..9].map do |movie_data|
      Movies.new(movie_data)
    end
  end

  def search_movies(query)
    service = MoviesService.new

    json = service.search_movies(query)

    @movies = json[:results].map do |movie_data|
      Movies.new(movie_data)
    end
  end

  def movie_details(id)
    service = MoviesService.new

    json = service.movie_details(id)

    @movies = json.map do |movie_data|
      Movies.new(movie_data)
    end
  end
end