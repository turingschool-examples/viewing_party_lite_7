# frozen_string_literal: true

class MoviesDetails
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :reviews

  def initialize(details, credits, reviews)
    @title = details[:title]
    @vote_average = details[:vote_average]
    @runtime = details[:runtime]
    @genres = details[:genres]
    @summary = details[:overview]

    @cast = credits[:cast].take(10)

    @total_reviews = reviews[:total_results]
    @reviews = reviews[:results]
  end

  def format_runtime
    "#{@runtime / 60}h #{@runtime % 60}m"
  end
end
