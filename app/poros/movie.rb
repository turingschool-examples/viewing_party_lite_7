class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview

  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
  end
end