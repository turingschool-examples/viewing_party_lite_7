# frozen_string_literal: true

class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :poster,
              :id

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    if attributes[:genres]
      @genres = attributes[:genres].map do |genre|
        genre[:name]
      end
    end
    @summary = attributes[:overview]
    @poster = attributes[:poster_path]
    @id = attributes[:id]
  end
end
