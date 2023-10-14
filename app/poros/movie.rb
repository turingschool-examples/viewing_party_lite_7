class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :description, :poster_path, :reviews
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres].map { |genre| genre[:name] }
    @description = data[:overview]
    @poster_path = data[:poster_path]
    @reviews = data[:reviews]
  end
end



