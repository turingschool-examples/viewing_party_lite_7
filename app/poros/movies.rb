class Movies 
  attr_reader :name, 
              :vote_average, 
              :movie_id

  def initialize(info)
    
    @name = info[:original_title]
    @vote_average = info[:vote_average]
    @movie_id = info[:id]
    @genres = info[:genre_ids]
    @runtime = info[:runtime]
    @description = info[:overview]
  end
end