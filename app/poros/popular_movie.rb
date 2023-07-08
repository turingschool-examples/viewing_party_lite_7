class PopularMovie
  attr_reader :id,
              :original_title,
              :vote_average
  def initialize(movie)
    @id             = movie[:id]
    @original_title = movie[:original_title]
    @vote_average   = movie[:vote_average]
  end
end