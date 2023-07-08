class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :image,
              :genres,
              :runtime,
              :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @image = data[:poster_path]
    @genres = data[:genres]
    @runtime = data[:runtime]
    @summary = data[:overview]
  end
end