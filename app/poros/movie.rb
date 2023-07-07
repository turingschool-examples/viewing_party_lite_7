class Movie 
  attr_reader :id,
              :title, 
              :vote, 
              :runtime,
              :genres,
              :summary,
              :cast,
              :num_reviews,
              :review_info
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:original_title]
    @vote = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @cast = movie_data[:credits][:cast][0..9]
    @num_reviews = movie_data[:reviews][:total_results]
    @review_info = movie_data[:reviews][:results]
  end

  # handle in view:
  # def get_genre_details
  #   @genres.map! do |hash|
  #     @genres << [:name]
  #   end
  # end

  # do in view
  # def get_cast_details

  # end

  # do this in the movie detials view:
  # def get_review_details
  #   @review_info.map! do |review|
  #     review[]
  #   end
  # end
end