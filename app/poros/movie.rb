class Movie
  attr_reader :title
  def initialize(attributes)
    @title = attributes[:title]
    @length = attributes[:length]
    @rating = attributes[:rating]
    @id = attributes[:id]
  end
end