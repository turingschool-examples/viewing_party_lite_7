class Movie
  attr_reader :title, :length, :rating, :id, :cast
  def initialize(attributes)
    @title = attributes[:title]
    @length = attributes[:length]
    @rating = attributes[:rating]
    @id = attributes[:id]
    @cast = attributes[:cast]
  end
end