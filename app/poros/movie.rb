class Movie
  attr_reader :id,
              :title, 
              :vote_average, 
              :num_reviews, 
              :runtime, 
              :summary, 
              :poster_path, 
              :genres,
              :cast

  def initialize(data, cast = nil)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @num_reviews = data[:vote_count]
    @runtime = convert_time(data[:runtime]) if data[:runtime]
    @summary = data[:overview]
    @poster_path = data[:poster_path]
    @genres = genre_names(data[:genres]) if data[:genres]
    @cast = cast[:cast][0..9] if cast
  end

  def genre_names(genres)
    genres.map do |genre|
      genre[:name]
    end
  end

  def convert_time(mins)
    hours = mins / 60
    minutes = mins % 60
    "#{hours}h #{minutes}m"
  end
end
