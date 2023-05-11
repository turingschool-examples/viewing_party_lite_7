# so movies from API can be converted to POROs
class Movie
  attr_reader :title, :id, :vote_average

  def initialize(data)
    @title = data[:original_title]
    @id = data[:id]
    @vote_average = data[:vote_average]
  end
end
