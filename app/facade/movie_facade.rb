class MovieFacade
  def self.top_rated
    json_response = MovieService.top_rated[:results]
    #top20 = json_response[0..20]
    # @results = json_response.map do |movie|
    #   Movie.new(movie)
    # end

  end
end