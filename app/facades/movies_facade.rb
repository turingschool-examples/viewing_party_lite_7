class MoviesFacade
  def search(keyword)
    service = MoviesService.new
 
    data = service.movie_search(keyword)

    data[:results].map do |data|
      Movie.new(data)
    end
  end

  def top_rated
    service = MoviesService.new
 
    data = service.top_rated_20

    data[:results].map do |data|
      Movie.new(data)
    end
  end

  def find_movie(movie_id)
    movie_data = MoviesService.new.movie(movie_id)
    cast_data = MoviesService.new.cast(movie_id)
    review_data = MoviesService.new.reviews(movie_id)

    combined_data = movie_data.merge(cast_data).merge(review_data)
    Movie.new(combined_data)
  end
end