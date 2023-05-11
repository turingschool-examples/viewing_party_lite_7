# frozen_string_literal: true

class Movie
  attr_reader :title,
              :vote_average,
              :overview,
              :poster_path,
              :id,
              :runtime,
              :genres,
              :summary,
              :cast

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @summary = attributes[:overview]
    @poster_path = attributes[:poster_path]
    @runtime = time_conversion(attributes[:runtime]) if !attributes[:runtime].nil?
    @genres = get_genres(attributes[:genres]) if !attributes[:genres].nil?
    @cast = []
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours} hours, #{rest} minutes" 
  end

  def get_genres(all_genres)
    genres = []
    all_genres.each do |genre|
      genres << genre[:name]
    end
    genres.join(", ")
  end

  def update(cast)
    cast[:cast][0..9].each do |member|
      @cast << { member[:name] => member[:character] }
    end
  end
end
