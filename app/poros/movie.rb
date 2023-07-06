class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :overview,
              :run_time,
              :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @overview = data[:overview]
    @run_time = data[:runtime]
    @poster = data[:poster_path]
  end
end
