class Movie
  attr_reader :title, :length, :id, :cast, :popularity, :overview, :genres, name
  def initialize(attributes)
    @title = attributes[:title]
    @runtime = attributes[:runtime]
    @vote_average = attributes[:vote_average]
    @popularity = attributes[:popularity]
    @id = attributes[:id]
    @cast = attributes[:cast]
    @overview = attributes[:overview]
    @genres = attributes[:genres]
    @name = attributes[:name]
  end
end