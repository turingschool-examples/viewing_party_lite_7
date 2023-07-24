class ViewingPartiesController < ApplicationController
  def new
    # require 'pry'; binding.pry
    # movie_id = params[:movie_id].to_i
    if !current_user
      redirect_to movie_path(params[:movie_id])
      flash[:error] = "You must login or register to view this page"
    else 
      @user = User.find(params[:user_id])
      @users = User.all
      @movie = MovieSearch.new.one_movie(params[:movie_id])
      @movie_cast = MovieSearch.new.movie_cast(params[:movie_id])
      @movie_reviews = MovieSearch.new.movie_reviews(params[:movie_id])
    #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #     faraday.headers["Authorization"] = ENV["api_access_key"]
    #   end
    #   response = conn.get("/3/search/movie/#{params[:movie_id]}")
    #   data = JSON.parse(response.body, symbolize_names: true)
    #   @movie = Movie.new(data)
    
    #   conn_cast = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #     faraday.headers["Authorization"] = ENV["api_access_key"]
    #   end
    #   response_cast = conn_cast.get("/3/movie/#{params[:movie_id]}/credits")
    #   data_cast = JSON.parse(response_cast.body, symbolize_names: true)
    #   @movie_cast = Movie.new(data_cast)
    #   @cast = @movie_cast.cast.first(10)
    #   conn_review = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #     faraday.headers["Authorization"] = ENV["api_access_key"]
    #   end
    #   response_review = conn_review.get("https://api.themoviedb.org/3/movie/447365/reviews")
    #   data_review = JSON.parse(response_review.body, symbolize_names: true)
    #   @review_count = data_review.count
    #   @review_data = data_review[:results]
    # #   redirect_to movie_path(@movie[:id])
    end
  end

  def create
    

    # redirect_to user_movie_path(@user.id, @movie[:id])
  end
end
