# frozen_string_literal: true

class Movie
  attr_reader :title,
              :vote_average,
              :overview,
              :poster_path,
              :id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @poster_path = attributes[:poster_path]
  end
end
