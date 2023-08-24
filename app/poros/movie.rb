class Movie
  attr_reader :title, :id, :vote_average, :runtime, :genres, :summary

  def initialize(title:, id:, vote_average:, runtime: "", genres: "", summary: "")
    @title = title
    @id = id
    @vote_average = vote_average
    @runtime = runtime
    @genres = genres
    @summary = summary
  end
end
