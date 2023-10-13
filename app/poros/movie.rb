# frozen_string_literal: true

class Movie
  @@movie = nil
  attr_reader :id,
              :title,
              :img,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @img = attributes[:poster_path]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @summary = attributes[:overview]
    @@movie = self
  end

  def find_genres
    @genres.map { |each| each[:name] }.join(', ')
  end

  def find_runtime
    hours = @runtime / 60
    mins = @runtime % 60
    "#{hours}h #{mins}mins"
  end

  def self.movie
    @@movie
  end
end
