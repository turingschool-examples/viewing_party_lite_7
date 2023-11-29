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
    details
  end

end