class SearchByKeywordFacade
  def initialize(keyword)
    @keyword = keyword
  end

  def details
    service = MovieService.new
    request = service.search_movie_by_keyword(@keyword)
    @movies = request[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end