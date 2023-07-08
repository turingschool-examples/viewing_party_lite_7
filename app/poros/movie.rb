class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @poster = data[:poster_path]
  end
end
