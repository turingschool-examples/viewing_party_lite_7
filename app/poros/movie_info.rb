class MovieInfo
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
    @genres = genres(data[:genres])
    @summary = data[:overview]
    @poster = data[:poster_path]
  end

  private

  def genres(genre_info)
    genre_types = []
    genre_info.map do |genre|
      genre_types << genre[:name]
    end
    genre_types
  end
end