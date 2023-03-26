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
  
  # This was not needed because it could be considered view logic
  # did this function in the movies show view page
    # def format_runtime
    #   "#{@runtime / 60} hrs #{@runtime % 60} mins"
    # end
    # <%= @the_movie.format_runtime %> minutes</p> 

    # Same reason as above, this was not needed: 
      # def list_genres
      #   genres.map do |g|
      #     g[:name]
      #   end
      # end
end