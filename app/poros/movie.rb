class Movie
  attr_reader :title, :rating

  def initialize(info)
    @title = info[:title]
    @rating = info[:vote_average]
  end
end