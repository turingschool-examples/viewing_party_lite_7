class MovieReviews
  attr_reader :results

  def initialize(movie_info)
    @results = movie_info[:results]
  end
end