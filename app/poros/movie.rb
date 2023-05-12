class Movie 
  attr_reader :id,
              :title,
              :rating,
              :runtime,
              :genres,
              :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title].to_s
    @rating = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview].to_s
    @image_url = data[:poster_path]
  end
end