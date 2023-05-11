class MovieDetailed
  attr_reader :id,
              :title,
              :vote_average,
              :image,
              :genre,
              :runtime,
              :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @image = data[:poster_path]
    @genre = genres(data[:genres])  # array of string
    @runtime = data[:runtime]
    @summary = data[:overview]
  end

  private

  def genres(genre_data)
    genre_data.map do |genre|
      genre[:name]
    end
  end
end
