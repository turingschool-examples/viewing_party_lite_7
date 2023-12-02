class MoviePoster
  attr_reader :file_path

  def initialize(movie_data)
    @file_path = movie_data[:posters].first[:file_path]
  end
end