class Movie
  attr_reader :title, :rating, :id

  def initialize(attributes)
    @title = attributes['title']
    @rating = attributes['vote_average']
    @id = attributes['id']
  end
end
