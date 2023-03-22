class Movie
  attr_reader :title,
              :summary,
              :vote_average

  def initialize(info)
    @title = info[:title]
    @summary = info[:overview]
    @vote_average = info[:vote_average]
  end
end
