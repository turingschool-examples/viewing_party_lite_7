class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genre_ids,
              :overview


  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genre_ids = data[:genre_ids]
    @overview = data[:overview]
  end
end