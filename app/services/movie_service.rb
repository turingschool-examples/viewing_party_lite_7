class MovieService

  def get_credits(tmdb_id)
    response = credits_conn(tmdb_id).get
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_reviews(tmdb_id)
    response = reviews_conn(tmdb_id).get
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_details(tmdb_id)
    response = details_conn(tmdb_id).get
    JSON.parse(response.body, symbolize_names: true)
  end

  def details_conn(tmdb_id)
    Faraday.new(url: "https://api.themoviedb.org/3/movie//#{tmdb_id}") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
  end

  def credits_conn(tmdb_id)
    Faraday.new(url: "https://api.themoviedb.org/3/movie//#{tmdb_id}/credits") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
  end

  def reviews_conn(tmdb_id)
    Faraday.new(url: "https://api.themoviedb.org/3/movie//#{tmdb_id}/reviews") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
  end

  def all_details(tmdb_id)
    { details: get_details(tmdb_id),
      credits: get_credits(tmdb_id)[:cast][0..9], 
      reviews: get_reviews(tmdb_id)[:results]}
  end

  def self.details_api_call(url)
    conn = Faraday.new(url: url) do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.image_api_call(movie_id)
    data = MovieService.details_api_call("https://api.themoviedb.org/3/movie/#{movie_id}")
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/#{data[:poster_path]}"
  end
end