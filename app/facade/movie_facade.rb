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
end
