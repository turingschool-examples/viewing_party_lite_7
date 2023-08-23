class Movie
  attr_reader :title, :id, :vote_average

  def initialize(title:, id:, vote_average:)
    @title = title
    @id = id
    @vote_average = vote_average
  end
end
