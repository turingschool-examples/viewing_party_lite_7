class Movie
  attr_reader :id,
              :title, 
              :vote_average, 
              :vote_count, 
              :runtime, 
              :summary, 
              :poster_path, 
              :genres,
              :cast,
              :num_reviews,
              :reviews

  def initialize(data, cast = nil, reviews = nil)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @runtime = convert_time(data[:runtime]) if data[:runtime]
    @summary = data[:overview]
    @poster_path = data[:poster_path]
    @genres = genre_names(data[:genres]) if data[:genres]
    @cast = convert_cast(cast[:cast][0..9]) if cast
    @num_reviews = reviews[:total_results] if reviews
    @reviews = reviews[:results] if reviews
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

  def convert_cast(cast)
    cast.map do |actor|
      actor[:name]
    end
  end
end
