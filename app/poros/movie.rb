class Movie
  attr_reader :backdrop_path, :genres, :id, :overview,
              :popularity, :poster_path, :release_date, :title,
              :vote_average, :vote_count, :runtime

  def initialize(data)
    @backdrop_path = data[:backdrop_path]
    @genres = data[:genres]
    @id = data[:id]
    @overview = data[:overview]
    @popularity = data[:popularity]
    @poster_path = data[:poster_path]
    @release_date = data[:release_date]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @runtime = data[:runtime]
  end

  def self.runtime_in_min(data)
    runtime_minutes = data[:runtime].to_i
    hours = runtime_minutes / 60
    minutes = runtime_minutes % 60
    "#{hours} hours #{minutes} minutes"
  end
end