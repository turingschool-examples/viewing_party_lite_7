class MovieService

  def self.get_movies
    conn = Faraday.new("https://api.themoviedb.org/3/")
    
    response = conn.get("movie/top_rated?page=1") do |faraday|
      faraday.params["API_KEY"] = Rails.application.credentials.movie[:key]
    end

    require 'pry';binding.pry

    # data = JSON.parse(response.body, symbolize_names: true)

    # members = data[:results][0][:members]

    # found_members = members.find_all {|m| m[:last_name] == params[:search]}
    # @member = found_members.first
    # render "welcome/index"
  end
end
