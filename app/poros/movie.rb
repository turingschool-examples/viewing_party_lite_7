class Movie
  attr_reader :title,
              :id,
              :summary,
              :vote_average,
              :vote_count,
              :image_url,
              :runtime,
              :genres

  def initialize(response)
    @title = response[:title]
    @id = response[:id]
    @summary = response[:overview]
    @vote_average = response[:vote_average]
    @vote_count = response[:vote_count]
    @image_url = response[:backdrop_path]
    @runtime = response[:runtime]
    @genres = response[:genres]
  end
end