class MovieFacade
  
  def self.top_rated
    json_response = MovieService.top_rated
    json_response[:results].map do |movie|
      Movie.new(movie)
    end.first(20)
  end

  # def self.search(search_term)
  #   JSON_response = MovieService.search(search_term)
  # end
end
