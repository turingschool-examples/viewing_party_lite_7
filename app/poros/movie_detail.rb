class MovieDetail
  attr_reader :title,
              :id,
              :overview,
              :genre,
              :runtime,
              :vote_average,
              :poster_path

  def initialize(response)
    #require 'pry'; binding.pry
    @title = response[:title]
    @id = response[:id]
    @overview = response[:overview]
    @genre = response[:genre]
    @runtime = response[:runtime]
    @vote_average = response[:vote_average]
    @poster_path = response[poster_path:]
  end
end