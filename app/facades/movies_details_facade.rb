class MoviesDetailsFacade
    attr_reader :movie_id, :service

    def initialize(id)
        @movie_id = id
        @service = MoviesService.new
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
end