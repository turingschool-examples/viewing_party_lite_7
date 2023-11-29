class Movie < ApplicationRecord
  has_many :party_movies
  has_many :parties, through: :party_movies
  validates :title, presence: true
  validates :runtime, presence: true

  def self.top_movies
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    movies = Hash.new
    data[:results].each do |movie|
      movies[movie[:title]] = [movie[:vote_average].round(1), movie[:id]]
    end
    movies
  end

  def self.search(search_params)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/search/movie?query=#{search_params}&include_adult=false&language=en-US&page=1") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    movies = Hash.new
    data[:results].each do |movie|
      movies[movie[:title]] = [movie[:vote_average].round(1), movie[:id]]
    end
    movies
  end

  def self.details(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{movie_id}") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    details = Hash.new
      details[:title] = data[:title]
      details[:runtime] = Movie.hrmin(data[:runtime])
      details[:vote_average] = data[:vote_average]
      details[:genre] = data[:genres].map { |genre| genre[:name] }.join(', ')
      details[:summary] = data[:overview]
    
    response = conn.get("/reviews")
    data = JSON.parse(response.body, symbolize_names: true)

    details[:cast] = Movie.cast(data[:cast])
    
    response = conn.get("/credits")
    data = JSON.parse(response.body, symbolize_names: true)
      
      details[:reviews] = data[:reviews]
      details[:review_count] = data[:review_count]
    details
  end

  def self.hrmin(param)
    hr = param / 60
    min = param % 60
    "#{hr}hr #{min}min"
  end

  def self.cast(arg)
    count = 0
    cast = Hash.new
    until count == 10
      cast[arg[count][:name]] = arg[count][:character]
      count += 1
    end
    cast
    require 'pry'; binding.pry
  end

end