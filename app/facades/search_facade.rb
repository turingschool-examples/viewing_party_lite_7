class SearchFacade

  def top_rated
    @service = MoviesService.new
    @data = @service.top_20

    @data["results"].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search(keyword)
    @service = MoviesService.new
    @data = @service.movie_search(keyword)

    @data["results"].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end