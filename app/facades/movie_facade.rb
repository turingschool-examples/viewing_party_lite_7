class MovieFacade
  attr_reader :keyword

  def initialize(keyword = nil)
    @keyword = keyword
  end

  def find_movies
    service = MovieService.new

    json = @keyword.nil? ? service.find_top_movies : service.search_movies_by_keyword(@keyword)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
