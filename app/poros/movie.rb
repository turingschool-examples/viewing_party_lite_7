# frozen_string_literal: false

# app/poros/movie.rb
class Movie
  attr_reader :title,
              :runtime,
              :summary

  def initialize(attributes)
    @title = attributes[:title]
    @runtime = attributes[:runtime]
    @vote_average_raw = attributes[:vote_average]
    @summary = attributes[:overview]

    @unfiltered_genre = attributes[:genres]
    @poster_path = attributes[:poster_path]
  end

  def image_url
    'https://image.tmdb.org/t/p/w92' << @poster_path
  end

  def genres
    @unfiltered_genre.map{|genre| genre[:name]}.join(', ')
  end

  def vote_average
    @vote_average_raw.round(1) unless @vote_average_raw.nil?
  end
end
