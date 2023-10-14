class MoviesDetailsFacade
    attr_reader :movie_id, :service

    def initialize(id)
        @movie_id = id
        @service = MoviesService.new
    end

    def movie_title
        json = @service.original_title(@movie_id)
        Movie.new(json)
    end

    def movie_details
        json = @service.details(@movie_id)
        Movie.new(json)
    end

    def movie_actors
        json = @service.credits(@movie_id)
        json[:cast].first(10).map do |data|
            Actor.new(data)
        end
    end

    def movie_reviews
        json = @service.reviews(@movie_id)
        json[:results].map do |review_data|
            Review.new(review_data)
        end
    end

    def movie_review_count
        json = @service.reviews(@movie_id)
        total = json[:results].map do |review_data|
            Review.new(review_data)
        end

        count = total.count
    end

    def movie_image
        json = @service.fetch_movie_details(@movie_id)
        image = json.dig('images', 'poster_path')

        if image.present?
            "https://image.tmdb.org/t/p/w500#{image}"
        else
            nil
        end
    end
end