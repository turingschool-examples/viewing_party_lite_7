class MovieFacade
  def initialize(title)
    @title = title
  end

  def get_discover_movies
    movie = MovieService.new

    json = movie.discover_movies
    search_results = json[:results].map do |movie|
      DiscoverMovie.new(movie)
    end
  end

  def get_search_movies
    movie = MovieService.new

    json = movie.search_movies(@title)
    search_results = json[:results].map do |movie|
      DiscoverMovie.new(movie)
    end
  end

  def discovery?
    @title.nil?
  end
end