class Movie

  attr_reader :title, :vote_average, :overview, :id

  def initialize(data)
    
    @title = data[:title]
    @vote_average = data[:vote_average]
    @overview = data[:overview]
    @id = data[:id]

  end
end