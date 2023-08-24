class Movie

  attr_reader :title, :vote_average, :id

  def initialize(movie_params)
    @title = movie_params[:title]
    @vote_average = movie_params[:vote_average]
    @id = movie_params[:id]
  end
end