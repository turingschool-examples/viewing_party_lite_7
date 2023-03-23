class Movie
  attr_reader :movie_id, :title, :vote_avg

  def initialize(info)
    @movie_id = info["id"]
    @title = info["title"]
    @vote_avg = info["vote_average"]
  end
end