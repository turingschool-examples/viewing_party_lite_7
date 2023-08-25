class Movie

  attr_reader :title,
              :vote_average,
              :id,
              :genres,
              :image,
              :summary,
              :runtime

  def initialize(movie_params)
    @title = movie_params[:title]
    @vote_average = movie_params[:vote_average]
    @id = movie_params[:id]
    @genres = movie_params[:genres]
    @image = movie_params[:backdrop_path]
    @summary = movie_params[:overview]
    @runtime = movie_params[:runtime]
  end
end