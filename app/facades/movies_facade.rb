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

  # def find_movie(movie_id)
  #   service = MoviesService.new
    
  #   data = service.find_by(movie_id)

  #   movie = Movie.new(data)
  # end

  # def find_movie_cast(movie_id)
  #   service = MoviesService.new

  #   data = service.cast(movie_id)

  #   cast = Movie.new(data)
  # end

  def find_movie(movie_id)
    movie_data = MoviesService.new.find_by(movie_id)
    cast_data = MoviesService.new.cast(movie_id)

    combined_data = movie_data.merge(cast_data)
    Movie.new(combined_data)
  end
end