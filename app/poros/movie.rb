class Movie
  attr_reader :id, 
              :title, 
              :vote_avg,
              :runtime, 
              :genres, 
              :summary,
              :image 

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote_avg = movie_data[:vote_avg]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @image = movie_data[:poster_path]
  end
end