class Movie
  attr_reader :title,
              :vote_average, 
              :overview
  
  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @overview = data[:overview]
  end
end