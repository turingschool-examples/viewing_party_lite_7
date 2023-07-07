class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :overview,
              :runtime,
              :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @overview = data[:overview]
    @runtime = format_time(data[:runtime])
    @poster = data[:poster_path]
  end

  def format_time(time)
    if time
      hours = time / 60
      minutes = time % 60
      "#{hours}hr #{minutes}min"
    else
      "no run time"
    end
  end
end
