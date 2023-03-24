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