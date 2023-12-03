class Movie
  attr_reader :movie_id,
              :title,
              :average,
              :runtime,
              :genres,
              :summary

  def initialize(attributes)
    @movie_id = attributes[:id]
    @title = attributes[:original_title]
    @average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @summary = attributes[:overview]
  end

  def convert_time
    hours = @runtime / 60
    minutes = @runtime % 60

    "#{hours}h #{minutes}min"
  end

  def format_genre
    format = @genres.map do |genre|
      genre[:name]
    end
    format.join(', ')
  end
end
