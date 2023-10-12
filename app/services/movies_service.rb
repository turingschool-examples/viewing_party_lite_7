class MoviesService

    def conn
        Faraday.new(url: "https://api.themoviedb.org") do |faraday|
          faraday.headers['api_key'] = Rails.application.credentials.tmdb[:key]
        end
    end

    def top_rated
        conn.get('3/movie/top_rated')
    end

    def search(title)
        conn.get('')
    end
end