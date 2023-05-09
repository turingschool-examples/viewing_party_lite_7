# app/facades/tmdb.rb
class TmdbFacade
  def self.top_rated_movies
    page_1 = TmdbService.top_rated_movies(1)[:results]
    page_2 = TmdbService.top_rated_movies(2)[:results]

    json = page_1 + page_2

    json.map do |data|
      Movie.new(data)
    end
  end
end