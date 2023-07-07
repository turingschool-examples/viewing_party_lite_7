class SearchFacade
  def initialize(search)
    @search = search
  end

  def movies
    service = MovieService.new

    json = service.search_movies(@search)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end