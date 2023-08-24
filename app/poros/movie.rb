class Movie
  attr_reader :title,
              :vote_average,
              :id

              # as attrs are added, be sure to test for them in PORO spec
  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]

  end
end