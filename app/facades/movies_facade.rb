class MoviesFacade
  attr_reader :search

  def initialize(search, keywords)
    @search = search
    @keywords = keywords
  end
  

  def top_20_rated
    service = MoviesService.new

    json = service.top_20_rated

    @top_20_rated = json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def keyword_results
    service = MoviesService.new

    json = service.keyword_search(@keywords)

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end