class TMDBService
  def self.top_rated
    json_from_url("movie/top_rated")[:results]  # api call only returns first 20 index
  end

  def self.search_movies(title)
    json_from_url("search/movie?query=#{title}")[:results]  # api call only returns first 20 index
  end

  # consider running this additional api call in separate thread, kicked off by ::top_rated or ::search_movies
  def self.get_movie(id)
    json_from_url("movie/#{id}")
  end

  # consider running this additional api call in separate thread
  def self.get_cast_and_reviews_for_movie(id)
    {
      cast: json_from_url("movie/#{id}/credits")[:cast].first(10),
      reviews: json_from_url("movie/#{id}/reviews")[:results]
    }
  end

  def self.get_poster(path)
    # Since this path starts with a /, Faraday replaces "/t/p/w500" with path
    # the image size needs to be extracted to this #get call
    media = poster_conn.get("w500" + path)
    # require 'pry'; binding.pry
    if media.success?
      File.binwrite("app/assets/images" + path, media.body)  # images must be handled with binary write
    else
      # Handle error
    end

    media.status
  end

  def self.json_from_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["Authorization"] = auth_token
    end
  end

  def self.poster_conn
    Faraday.new(url: "https://image.tmdb.org/t/p/") do |faraday|
      faraday.headers["Authorization"] = auth_token
    end
  end

  def self.auth_token
    "Bearer " + Rails.application.credentials.tmdb[:auth]
  end
end
