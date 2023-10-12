class MoviesSearchFacade
    def initialize(query)
        @query = query
        @service = MoviesService.new
    end

    def movies
        json = @service.search
    end
end