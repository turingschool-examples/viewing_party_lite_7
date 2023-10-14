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

  def find_movie(id)
    movie_data = MoviesService.new.find(id)
    cast_data = MoviesService.new.cast(id)
    review_data = MoviesService.new.reviews(id)

    combined_data = movie_data.merge(cast_data).merge(review_data)
    Movie.new(combined_data)
  end
end