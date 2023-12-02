class Movie
  attr_reader :movie_id,
              :title,
              :vote_average,
              :runtime,
              :genre,
              :overview,
              :cast,
              :vote_count,
              :review_info

  def initialize(attributes)
    @movie_id      = attributes[:id]
    @title         = attributes[:title]
    @vote_average  = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genre = attributes[:genre_id]
    @overview = attributes[:overview]
    @cast = attributes[:cast]
    @vote_count = attributes[:vote_count]
    @review_info = attributes[:results]
  end

  def convert_runtime_to_hours_and_minutes
    hours = @runtime / 60
    remaining_minutes = @runtime % 60

    "#{hours} hours and #{remaining_minutes} minutes"
  end
end
