class MovieFacade
  def self.top_rated
    MovieService.top_rated_movies[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end
end