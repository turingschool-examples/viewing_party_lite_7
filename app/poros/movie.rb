# frozen_string_literal: true

class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :image
              

  def initialize(movie_data) ## < -- movie_data is coming in from the Movie Facade
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @image = movie_data[:poster_path]
  end

  def runtime_conversion
    hours = @runtime / 60
    minutes = @runtime % 60
    "#{hours}hr #{minutes}min"
  end
end
