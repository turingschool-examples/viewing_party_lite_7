class Movie
  attr_reader :id, 
              :title, 
              :vote_avg,
              :runtime, 
              :genres, 
              :summary
              
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote_avg = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
  end

  def formatted_runtime
    hours = @runtime / 60
    mins = @runtime % 60

    "#{hours}hr #{mins}min" 
  end
end