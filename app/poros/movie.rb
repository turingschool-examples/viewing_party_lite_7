class Movie
  attr_reader :title,
              :summary,
              :vote_average,
              :movie_id

  def initialize(info)
    @movie_id = info[:id]
    @title = info[:title]
    @summary = info[:overview]
    @vote_average = info[:vote_average]
  end
end
