class Movie 
  attr_reader :title, 
              :vote_average, 
              :id, 
              :run_time, 
              :genres, 
              :summary
  
  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @id = attributes[:id]
    @run_time = attributes[:run_time]
    @genres = attributes[:genres]
    @summary = attributes[:summary]
  end
end