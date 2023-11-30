class MovieService
  def conn
    Faraday.new("https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end
  
  def popular_movies
   get_url("movie/popular")
  end

  def search_movies(search_params)
    get_url("search/movie?query=#{search_params}")
  end

  def self.get_detailed_movie(id)
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/#{id}") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)   
    DetailedMovie.new(movie_data)
  end

  def self.get_movie_cast(id)
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/#{id}/credits") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end

    cast_data = JSON.parse(response.body, symbolize_names: :true)   
    cast_data[:cast].map do |actor_hash|
      MovieActor.new(actor_hash)
    end
  end

  def self.get_movie_reviews(id)
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/#{id}/reviews") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end

    review_data = JSON.parse(response.body, symbolize_names: :true)   
    review_data[:results].map do |review_hash|
      MovieReview.new(review_hash)
    end
  end

  def self.get_review_count
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/#{id}/reviews") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end

    review_data = JSON.parse(response.body, symbolize_names: :true)   
    review_data[:results].map do |review_hash|
      MovieReview.new(review_hash)
    end
  end
end