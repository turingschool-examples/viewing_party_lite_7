class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :overview,
              :runtime,
              :poster_path

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genres = format_genres(data[:genres])
    @overview = data[:overview]
    @runtime = format_time(data[:runtime])
    @poster_path = data[:poster_path]
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

  def format_genres(genre_details)
    movie_genres = genre_details.map {|g| g[:name] }
  end
end
