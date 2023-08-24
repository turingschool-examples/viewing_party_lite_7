class MovieService
  # def conn
  #   Faraday.new(url: "https://api.themoviedb.org") do |faraday|
  #     faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
  #   end
  # end

  # def get_url(url)
  #   require 'pry'; binding.pry
  #   repsonse = conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)
  #   data = JSON.parse(response.body, symbolize_names: true)
  #   data[:results]
  # end

end