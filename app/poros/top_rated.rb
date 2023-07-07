class TopRated
  attr_reader :top_rated_movies
  def initialize(data)
    @top_rated_movies = data[:results]
  end
end