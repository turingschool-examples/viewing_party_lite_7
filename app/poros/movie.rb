class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :id

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres].map do |genre|
      genre[:name]
    end
    @summary = attributes[:overview]
    @id = attributes[:id]
  end

end 