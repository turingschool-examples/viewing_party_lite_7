# frozen_string_literal: true

# app/poros/movie_index.rb
class MovieIndex
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average_raw = attributes[:vote_average]
    @id = attributes[:id]
  end

  def vote_average
    # @vote_average_raw.round(1) unless @vote_average_raw.nil?
    @vote_average_raw&.round(1)
  end
end
