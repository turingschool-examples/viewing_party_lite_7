class Movie
  attr_reader :movie_id,
              :title,
              :vote_avg,
              :image,
              :runtime,
              :summary,
              :genres,
              :cast,
              :reviews
  
  def initialize(info)
    @movie_id = info[:movie][:id]
    @title = info[:movie][:title]
    @vote_avg = info[:movie][:vote_average]
    @image = info[:movie][:poster_path]
    @runtime = info[:movie][:runtime]
    @summary = info[:movie][:overview]
    @genres = info[:movie][:genres]
    @cast = info[:cast]
    @reviews = info[:reviews]
  end

  def review_count
    reviews.size
  end
end