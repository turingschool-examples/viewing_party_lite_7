class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary


  def initialize(movie_data)
  #   require 'pry'; binding.pry
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @cast = movie_data[:cast]
    @total_review_count = movie_data[:total_results]
    @reviewer = movie_data[:results]
    # @reviewer_info = movie_data[:reviewer_info]
  end
end

# <li>Reviewer Information: <%= @movie.reviewer_info %></li>