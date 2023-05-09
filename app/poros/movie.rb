class Movie
  attr_reader :id,
  :title,
  :summary,
  :vote_average,
  :vote_count,
  :poster_path,
  :total_min,
  :cast,
  :genres,
  :reviews,
  :runtime
  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @summary      = data[:overview]
    @vote_average = data[:vote_average]
    @vote_count   = data[:vote_count]
    @poster_path  = data[:poster_path]
    @total_min    = nil
    @runtime      = nil
    @cast         = nil
    @genres       = nil
  end
end