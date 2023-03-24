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
  
  def initialize(response)
    # binding.pry
    @movie_id = response[:movie][:id]
    @title = response[:movie][:title]
    @vote_avg = response[:movie][:vote_average]
    @image = response[:movie][:poster_path]
    
    @runtime = response[:movie][:runtime]
    @summary = response[:movie][:overview]
    @genres = response[:movie][:genres]

    @cast = response[:cast]
    @reviews = response[:reviews]
  end

  def review_count
    reviews.size
  end
end