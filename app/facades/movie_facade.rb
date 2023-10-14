class MovieFacade
  attr_reader :movie_details, :url, :movie_id

  def initialize(movie_id)
    @movie_id = movie_id
    @url = 'https://api.themoviedb.org'
  end

  def self.top_rated_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.api_key
    end
  
    response = conn.get("/3/movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
  
    if json[:results].present?
      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    else
      @movies = []
    end
  
    @movies
  end
  
  def self.search(search_string)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.api_key
      faraday.params['query'] = search_string
    end
  
    response = conn.get("/3/search/movie")
    json = JSON.parse(response.body, symbolize_names: true)
  
    if json[:results].present?
      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    else
      @movies = []
    end
  
    @movies
  end
  
  def self.find_by_id(id)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.api_key
      faraday.params['movie_id'] = id
    end
  
    response = conn.get("/3/movie/#{id}")
    json = JSON.parse(response.body, symbolize_names: true)
    Movie.new(json)
  end

  def self.find_cast(id)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.api_key
      faraday.params['movie_id'] = id
    end
    response = conn.get("/3/movie/#{id}/credits")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:cast].map do |cast_member|
      CastMember.new(cast_member)
    end
  end
end  
