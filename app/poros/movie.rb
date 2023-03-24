# frozen_string_literal: true

class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :poster,
              :id,
              :formatted_runtime

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
    @formatted_runtime = runtime_to_hrs_mins(attributes[:runtime]) unless attributes[:runtime].nil?
  end

  def runtime_to_hrs_mins(runtime)
    hours = runtime / 60
    minutes = runtime % 60
    "#{hours}h #{minutes}m"
  end
end
