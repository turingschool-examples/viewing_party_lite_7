class Movie
  attr_reader :id,
              :title,
              :rating,
              :runtime,
              :genres,
              :summary

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title].to_s
    @rating = movie_data[:vote_average] ? nil : movie_data[:vote_average].round(1)
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview].to_s
    @image_url = movie_data[:poster_path]
  end
end
