class Movie < ApplicationRecord
  has_many :parties
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

  def self.details_api_call(url)
    conn = Faraday.new(url: url) do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(movie_id)
    data = Movie.details_api_call("https://api.themoviedb.org/3/movie/#{movie_id}")
    details = Hash.new
      details[:id] = data[:id]
      details[:title] = data[:title]
      details[:runtime] = data[:runtime]
      details[:vote_average] = data[:vote_average]
      details[:genre] = data[:genres].map { |genre| genre[:name] }.join(', ')
      details[:summary] = data[:overview]

    data = Movie.details_api_call("https://api.themoviedb.org/3/movie/#{movie_id}/credits")

    details[:cast] = Movie.cast(data[:cast])
    
    data = Movie.details_api_call("https://api.themoviedb.org/3/movie/#{movie_id}/reviews")
      
      details[:reviews] = Movie.reviews(data[:results])
      details[:review_count] = data[:total_results]
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
  end

  def self.reviews(reviews)
    reviews.map do |review|
      [review[:author], review[:content]]
    end
  end

  def self.create_from_api(movie_id)
    data = data = Movie.details_api_call("https://api.themoviedb.org/3/movie/#{movie_id}")
    Movie.create!({
      title: data[:title],
      tmdb_id: data[:id],
      runtime: data[:runtime]
    })
  end

  def self.image_api_call(movie_id)
    data = Movie.details_api_call("https://api.themoviedb.org/3/movie/#{movie_id}")
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/#{data[:poster_path]}"
  end

end

