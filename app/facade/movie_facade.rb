class MovieFacade
  def self.top_rated
    json_response = MovieService.top_rated[:results]
    @results = json_response.map do |movie|
      Movie.new(movie)
    end.first(20)
  end

  def self.searched_movies(searched_term)
    json_response = MovieService.searched_movies(searched_term)
    json_response[:results].map do |movie|
      Movie.new(movie)
    end.first(20)
  end

  def self.movie_details(id)
    MovieService.movie_details(id)
  end

  def self.movie_cast(id)
    MovieService.movie_cast(id)
  end

  def self.movie_reviews(id)
    MovieService.movie_reviews(id)
  end
end
