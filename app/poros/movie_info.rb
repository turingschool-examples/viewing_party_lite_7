class MovieInfo
  attr_reader :title,
              :vote_avg,
              :runtime,
              :summary,
              :genre
  
  def initialize(response)
    @title = response[:title]
    @vote_avg = response[:vote_average]
    @runtime = response[:runtime]
    @summary = response[:overview]
    @genre = response[:genres]
  end
  
  def list_genres
    genre.map do |g|
      g[:name]
    end
  end
end