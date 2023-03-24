class Movie
  attr_reader :movie_id,
              :title,
              :vote_avg,
              :runtime,
              :summary,
              :genres, 
              :cast,
              :reviews
  
  def initialize(response)
    @movie_id = response[:movie][:id]
    @title = response[:movie][:title]
    @vote_avg = response[:movie][:vote_average]
    
    @runtime = response[:movie][:runtime]
    @summary = response[:movie][:overview]
    @genres = response[:movie][:genres]

    @cast = response[:cast]
    @reviews = response[:reviews]
  end

  def review_count
    reviews.size
  end
  
  def format_runtime
    "#{@runtime / 60} hrs #{@runtime % 60} mins"
  end

  # def list_genres
  #   genres.map do |g|
  #     g[:name]
  #   end
  # end

  # def format_runtime
  #   "#{@runtime / 60} hrs #{@runtime % 60} mins"
  # end
end