# frozen_string_literal: true

class Movie
  attr_reader :id,
              :title,
              :vote_average

  ## < -- movie_data is coming in from the Movie Facade
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
  end
end
