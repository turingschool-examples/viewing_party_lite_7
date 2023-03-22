class Movie
  attr_reader :title,
              :run_time,
              :genre,
              :summary,
              :cast,
              :vote_average,
              :image_url

  def initialize(movie_data)
    @title = movie_data[:title]
    @run_time = movie_data[:runtime]
    @genre = movie_data[:genre].map { |genre| genre[:name] }
    @summary = movie_data[:overview]
    @cast = movie_data[:credits][:cast].first(10)
    @vote_average = movie_data[:vote_average]
    @image_url = movie_data[:poster_path]
  end
end