class Movie 
  attr_reader :id,
              :title,
              :vote_average,
              :image,
              :genres,
              :runtime,
              :summary

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @original_title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @image = movie_data[:poster_path]
    @genres = movie_data[:genres]
    @runtime = movie_data[:runtime]
    @summary = movie_data[:overview]
    
  end
end