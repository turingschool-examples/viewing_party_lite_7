
class Top20Facade
  attr_reader :top20, :top_movies

  def initialize(top_movies)
    @top_movies = top_movies
    @top20 = top20
  end

  def top20
    service = Top20Service.new
    json = service.top20
    json[:results].map do |movie|
      MovieSearch.new(movie)
    end
  end
end
