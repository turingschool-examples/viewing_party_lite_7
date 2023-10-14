class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :overview,
              :runtime,
              :image


  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @image = data[:backdrop_path]
  end

  def genre_info
    @genres.map do |genre|
      genre[:name]
    end.join(", ")
  end

  def format_runtime
    "#{@runtime/ 60}hr #{@runtime % 60}min"
  end

end