# frozen_string_literal: true

class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org/') do |f|
      f.params['api_key'] = Rails.application.credentials.themoviedb[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_movies(query)
    get_url("3/search/movie?query=#{query}&include_adult=false&language=en-US&page=1")
  end

  def top_rated_movies
    get_url('3/movie/top_rated?language=en-US&page=1')
  end

  def movie_details(movie_id)
    get_url("3/movie/#{movie_id}?language=en-US")
  end

  def cast(movie_id)
    get_url("3/movie/#{movie_id}/credits?language=en-US")
  end

  def movie_reviews(movie_id)
    get_url("3/movie/#{movie_id}/reviews?language=en-US")
  end
end
