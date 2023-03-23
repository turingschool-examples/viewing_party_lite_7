class MovieInfo
  attr_reader :title,
              :vote_avg,
              :runtime,
              :summary,
              :genre
  
  def initialize(result)
    @title = result[:title]
    @vote_avg = result[:vote_average]
    @runtime = result[:runtime]
    @summary = result[:overview]
    @genre = result[:genres]
  end
  
  def list_genres
    @genres.map
    
  end
end