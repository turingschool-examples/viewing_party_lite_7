class Movie
  attr_reader :id, 
              :title, 
              :vote_average, 
              :runtime, 
              :genres, 
              :summary, 
              :poster, 
              :reviews, 
              :cast
  
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:summary]
    @poster = data[:poster]
    @reviews = data[:reviews]
    @cast = data[:cast]
  end
end