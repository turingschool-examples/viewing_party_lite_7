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
end
