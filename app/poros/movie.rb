class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = genre_names(attributes[:genres])
    @summary = attributes[:overview]
    @cast = attributes[:cast]
    @reviews = attributes[:reviews]
  end

  def genre_names(genres)
    if genres != nil
        genres.map do |genre|
        genre[:name]
      end
    end
  end
end