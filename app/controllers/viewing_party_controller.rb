class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["api_access_key"]
    end
    response = conn.get("/3/search/movie/#{params[:movie_id]}")
    data = JSON.parse(response.body, symbolize_names: true)
    @movie = PopularMovie.new(data)

    conn_cast = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["api_access_key"]
    end
    response_cast = conn_cast.get("/3/movie/#{params[:movie_id]}/credits")
    data_cast = JSON.parse(response_cast.body, symbolize_names: true)
    @movie_cast = PopularMovie.new(data_cast)
    @cast = @movie_cast.cast.first(10)

    conn_review = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["api_access_key"]
    end
    response_review = conn_review.get("https://api.themoviedb.org/3/movie/447365/reviews")
    data_review = JSON.parse(response_review.body, symbolize_names: true)
    @review_count = data_review.count
    @review_data = data_review[:results]
  end
end