class MovieDetails
  attr_reader :title, 
              :overview, 
              :vote_average, 
              :id, 
              :runtime,
              :poster_path,
              :genres

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @overview = attributes[:overview]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @poster_path = attributes[:poster_path]
    @genres = attributes[:genres].map { |genre| genre[:name]}
  end
end