class MoviesFacade
  attr_reader :search

  def initialize(search, keywords)
    @search = search
    @keywords = keywords
  end
  
  def movie_details
    service = MoviesService.new
    json = service.get_movie_details(@search)
    Movie.new(json)
  end

  def top_20_rated
    service = MoviesService.new

    json = service.top_20_rated

    json[:results].first(20).map do |movie_data|
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