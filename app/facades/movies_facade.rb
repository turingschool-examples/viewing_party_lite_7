class MoviesFacade
  def initialize(search)
  end

  def top_20_rated
    service = MoviesService.new

    json = service.top_20_rated

    @top_20_rated = json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end
end