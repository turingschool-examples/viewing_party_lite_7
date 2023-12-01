class DetailedMovie
  attr_reader :title, :vote_average, :id, :runtime, :genres, :summary

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    # still need cast members, total reviews, review's information
  end

  def genres_as_list
    @genres.map do |genre|
      genre[:name]
    end
  end

  def runtime_in_hours_and_minutes
    "#{@runtime/60}h #{@runtime % 60}min"
  end
end