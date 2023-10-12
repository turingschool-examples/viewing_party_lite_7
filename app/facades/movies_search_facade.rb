class MoviesSearchFacade
  def initialize(query)
    @query = query
  end

  def movies
    @service = MoviesService.new

    json = @service.movies_by_title(@query)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
    #require 'pry';binding.pry
  end
end