class UserFacade
  attr_reader :user
  def initialize(user_id)
    WebMock.allow_net_connect!
    @user = User.find(user_id)
  end

  def movie_poster_link(movie_id)
    response = MovieService.new.movie_poster(movie_id)
    url = response[:posters].first[:file_path]
    "https://image.tmdb.org/t/p/w185#{url}"
  end

  def get_movie_title(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/movie/#{movie_id}")

    json = JSON.parse(response.body, symbolize_names: true)
    json[:title]
  end
end