class MoviesFacade
  attr_reader :keyword

  def initialize(keyword = nil)
    @keyword = keyword
  end

  def search(keyword)
    service = MoviesService.new
 
    data = service.movie_search(keyword)
    @search_results = data[:results].map do |data|
      Movie.new(data)
    end
  end

  def top_rated
    service = MoviesService.new
 
    data = service.top_rated_20

    results = data[:results].map do |data|
      Movie.new(data)
    end
  end
end