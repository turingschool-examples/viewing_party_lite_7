class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @summary = attributes[:overview]
  end

  def find_genres
    @genres.map {|each| each[:name]}.join(", ")
  end

  def find_runtime
    hours = @runtime / 60
    mins = @runtime % 60
    "#{hours}h #{mins}mins"
  end
end
