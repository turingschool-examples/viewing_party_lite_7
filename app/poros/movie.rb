class Movie
  attr_reader :title, :vote_average, :id

  def initialize(data)
    @title = data[:original_title]
    @id = data[:id]
    @vote_average = data[:vote_average]&.round(1) 
  end
end