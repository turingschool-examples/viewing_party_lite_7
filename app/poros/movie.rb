class Movie
  attr_reader :title,
              :runtime,
              :genres,
              :overview,
              :vote_average,
              :poster_path,
              :id

  def initialize(movie_data)
    @title = movie_data[:title]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]#.map { |genre| genre[:name] }
    @overview = movie_data[:overview]
    @vote_average = movie_data[:vote_average]
    @poster_path = movie_data[:poster_path]
    @id = movie_data[:id]
  end
end