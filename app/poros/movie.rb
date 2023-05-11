class Movie
  attr_reader :id,
              :title,
              :poster_path,
              :rating,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @poster_path = data[:poster_path]
    @rating = data[:rating]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:summary]
    @cast = data[:cast]
    @reviews = data[:reviews]
  end
end
