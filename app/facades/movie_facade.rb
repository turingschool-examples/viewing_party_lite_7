class MovieFacade
  def initialize(movie)
    @movie = movie
  end

  def top_twenty
    service = MovieService.new

    json = service.top_20_flicks(@movie)

    @top_twenty = json[:results].map do |top_twenty_data|
      TopTwenty.new(top_twenty_data)
    end
  end
end
  