class Movie
  attr_reader :title, 
              :vote_average, 
              :num_reviews, 
              :runtime, 
              :summary, 
              :poster_path, 
              :genres

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @num_reviews = data[:vote_count]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @poster_path = data[:poster_path]
    @genres = genre_names(data[:genres])
  end

  def genre_names(genres)
    genres.map do |genre|
      genre[:name]
    end
  end
end
