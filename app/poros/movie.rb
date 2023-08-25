class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :total_review_count,
              :reviewer


  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = genre_parse(movie_data[:genres])
    @summary = movie_data[:overview]
    @cast = movie_data[:cast]
    @total_review_count = movie_data[:total_results]
    @reviewer = movie_data[:results]
    @reviewer_info = movie_data[:results]
  end
end

def genre_parse(movie_data)
  return "" if movie_data.nil?

  genres = movie_data.map { |hash| hash[:name] }
  genres.join(", ")
end

# def format_time(movie_data)
#   hours = movie_data / 60
#   minutes = movie_data % 60
# end

# def formatted_runtime
#   "#{@runtime / 60}h #{@runtime % 60}min"
# end