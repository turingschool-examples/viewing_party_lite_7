class SingleMovieDetails
  attr_reader :movie_title,
              :runtime,
              :id

  def initialize(attributes)
    @movie_title = attributes[:title]
    @runtime = attributes[:runtime]
    @id = attributes[:id]
  end
end
