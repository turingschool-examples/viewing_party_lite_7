class Movie
  attr_reader :title, :length, :id, :cast, :popularity
  def initialize(attributes)
    @title = attributes[:title]
    @length = attributes[:length]
    @popularity = attributes[:popularity]
    @id = attributes[:id]
    @cast = attributes[:cast]
  end
end