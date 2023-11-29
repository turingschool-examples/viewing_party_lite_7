class MoviesController < ApplicationController
  def search
    conn = Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response = conn.get("/3/movie/top_rated?page=1")

    data = JSON.parse(response.body)
    # require 'pry';binding.pry


    # members = data[:results][0][:members]

    # found_members = members.find_all {|m| m[:last_name] == params[:search]}
    # @member = found_members.first
    # render "welcome/index"
  end
end