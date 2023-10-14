# frozen_string_literal: true

class MovieDetails
  attr_reader :id,
              :title,
              :vote_average,
              :vote_count,
              :runtime,
              :summary,
              :genres,
              :poster_path

  def initialize(movie_info)
    @id = movie_info[:id]
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @runtime = movie_info[:runtime]
    @summary = movie_info[:overview]
    @genres = movie_info[:genres]
    @poster_path = movie_info[:poster_path]
  end
end
