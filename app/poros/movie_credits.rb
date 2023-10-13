class MovieCredits
  attr_reader :cast

  def initialize(movie_info)
    @cast = movie_info[:cast].first(10)
  end
end