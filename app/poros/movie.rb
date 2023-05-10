class Movie
  attr_reader :title, :vote_average, :id, :runtime, :genres

  def initialize(data)
    @data = data
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @runtime = data[:runtime]
    @genres = data[:genres]
  end
end