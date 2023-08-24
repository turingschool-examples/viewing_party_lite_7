class Movie
  attr_reader :title,
              :vote_average

              # as attrs are added, be sure to test for them in PORO spec
  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]

  end
end