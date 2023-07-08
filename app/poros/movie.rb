class Movie 
  attr_reader :title, 
              :vote_average, 
              :id, 
              :runtime, 
              :genres, 
              :overview
  
  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @id = attributes[:id]
    @runtime = attributes[:run_time]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
  end
end