class Movie < ApplicationRecord
  has_many :parties
  validates :title, presence: true
  validates :runtime, presence: true


  def self.details_api_call(url)
    conn = Faraday.new(url: url) do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
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

