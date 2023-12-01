class SingleMovieDetails
  attr_reader :movie_title,
              :runtime

  def initialize(attributes)
    @movie_title = attributes[:title]
    @runtime = attributes[:runtime]
  end
end