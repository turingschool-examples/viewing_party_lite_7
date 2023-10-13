class MoviePoro
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :cast, :results, :poster_path

  def initialize(data)
    # require 'pry';binding.pry
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @cast = data[:cast]
    @results = data[:results]
    @poster_path = data[:poster_path]
  end
end