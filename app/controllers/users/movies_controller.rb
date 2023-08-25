# frozen_string_literal: true

module Users
  class MoviesController < ApplicationController
    def index
      @user = params[:user_id]
      conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['MOVIES_API_KEY']
      end

      response = conn.get('/3/discover/movie')
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results].take(20)

      movies = data[:results]
      found_movies = movies.find_all { |m| m[:title] == params[:search] }
      @movie = found_movies.first
    end

    def show
      @user = params[:user_id]

      # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      #   faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
      # end
      id = params[:id]
      @movie = MovieFacade.call('/3/discover/movie', id)
      #response = MovieService.new('/3/discover/movie')
      #response.retrieve_movie_details
      #data = JSON.parse(response.body, symbolize_names: true)

      # movies = data[:results]
      # found_movies = movies.find_all { |m| m[:id] == params[:id].to_i }
      # @movie = found_movies.first
      #-----------------cast--------------------
      conn2 = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['MOVIES_API_KEY']
      end

      response2 = conn2.get("/3/movie/#{id}/credits")
      data2 = JSON.parse(response2.body, symbolize_names: true)
      @cast = data2[:cast].take(10)
      #-----------------reviews--------------------
      conn3 = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['MOVIES_API_KEY']
      end

      response3 = conn3.get("/3/movie/#{id}/reviews")
      data3 = JSON.parse(response3.body, symbolize_names: true)
      @reviews = data3[:results].take(10)
      @total_reviews = data3[:total_results]

      #-----------------details--------------------
      conn4 = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['MOVIES_API_KEY']
      end

      response4 = conn4.get("/3/movie/#{id}")
      @data4 = JSON.parse(response4.body, symbolize_names: true)
      @runtime = @data4[:runtime] / 60
      @runtime_minutes = @data4[:runtime] % 60
    end

    def search; end
  end
end
