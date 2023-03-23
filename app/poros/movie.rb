class Movie
  attr_reader :title,
              :vote_average, 
              :overview,
              :id
  
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @overview = data[:overview]
  end
end