class TmdbService
  def self.connect
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["TMDB-KEY"]
    end
  end
end
# facade: 
# response = conn.get("/congress/v1/116/senate/members.json")
# data = JSON.parse(response.body, symbolize_names: true)

# poros:
# members = data[:results][0][:members]

# controller action:
# found_members = members.find_all {|m| m[:last_name] == params[:search]}
# @member = found_members.first