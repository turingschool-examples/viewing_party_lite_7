class Movie
  attr_reader :title,
              :run_time,
              :genre,
              :overview,
              :vote_average,
              :poster_path

  def initialize(movie_data)
    @title = movie_data[:title]
    @run_time = movie_data[:run_time]
    @genre = movie_data[:genre].map { |genre| genre[:name] }
    @overview = movie_data[:overview]
    @vote_average = movie_data[:vote_average]
    @poster_path = movie_data[:poster_path]
  end
end