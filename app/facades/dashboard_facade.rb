class DashboardFacade

    attr_reader :user, :params

    def initialize(params)
        @params = params
        @user = User.find(params[:id])
    end

    def service
        @_movie_service ||= MovieService.new
    end

    def invited_parties
        @user.viewing_party_users.map do |party|
            ViewingParty.find(party.viewing_party_id)
        end
    end

    def created_parties
        @user.viewing_parties
    end

    def movie(movie_id)
        json = service.movie_details(movie_id)
        Movie.new(json)
    end

    def movie_image(movie_id)
        Image.new(service.movie_image(movie_id))
    end
end