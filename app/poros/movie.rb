# frozen_string_literal: true

class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :overview,
              :runtime

  def initialize(movie_info)
    @id = movie_info[:id]
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @genres = movie_info[:genres]
    @overview = movie_info[:overview]
    @runtime = movie_info[:runtime]
  end
end
