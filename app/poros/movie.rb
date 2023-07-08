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
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
  end

  def format_runtime
    hours = @runtime / 60
    minutes = @runtime % 60
    "#{hours} hours, #{minutes} minutes"
  end
end