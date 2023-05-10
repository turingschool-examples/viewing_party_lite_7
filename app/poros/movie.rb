class Movie 
  attr_reader :title,
              :rating,
              :runtime,
              :genres,
              :summary

  def initialize(data)
    @title = data[:title].to_s
    @rating = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres].to_s
    @summary = data[:overview].to_s
  end
end