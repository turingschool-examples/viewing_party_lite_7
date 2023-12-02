class MovieFacade
  
  def self.top_rated
    json_response = MovieService.top_rated
    json_response[:results].map do |movie|
      Movie.new(movie)
    end.first(20)
  end

  def self.search(search_term)
    json_response = MovieService.search(search_term)
    json_response[:results].map do |movie|
      Movie.new(movie)
    end.first(20)
  end

  def self.movie_details(movie)
    json_response = MovieService.movie_details(movie)
    Movie.new(json_response)
  end

  def self.cast(movie)
    json_response = MovieService.cast(movie)
    json_response[:cast].map do |cast|
      Cast.new(cast)
    end.first(10)
  end

  def self.reviews(movie)
    json_response = MovieService.reviews(movie)
    json_response[:results].map do |result|
      Review.new(result)
    end.first(10)
  end
end
