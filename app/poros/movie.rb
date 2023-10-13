class Movie
  attr_reader :title,
              :runtime,
              :vote_average,
              :summary
  def initialize(attributes)
    @title = attributes[:title]
    @runtime = attributes[:runtime]
    @vote_average = attributes[:vote_average].round(1)
    @summary = attributes[:overview]

    @unfiltered_genre = attributes[:genres]
    @poster_path = attributes[:poster_path]
  end

  def image_url
    "https://image.tmdb.org/t/p/w92" << @poster_path
  end

  def genres
    @unfiltered_genre.map{|genre| genre[:name]}.join(', ')
  end

end




