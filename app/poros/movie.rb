# so movies from API can be converted to POROs
class Movie
  attr_reader :title, :id

  def initialize(data)
    @title = data[:original_title]
    @id = data[:id]
  end
end
