class MovieFacade
  def initialize(title)
    @title = title
  end

  def movie
    movie = MovieService.new

    json = movie.search_movies(@title)

    @search_results = json[:results].map do |movie|
      Movie.new(movie)
    end
  end
end