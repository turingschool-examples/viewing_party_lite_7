class ShowFacade < DashboardFacade
  def initialize(params)
    @params = params
  end

  def movie
    json = service.movie_details(@params[:id])
    Movie.new(json)
  end

  def cast_members
    json = service.cast_members(@params[:id])
    json[:cast][0..9].map do |cast_member|
      CastMember.new(cast_member)
    end
  end

  def reviews
    json = service.reviews(@params[:id])
    json[:results].map do |review|
      Review.new(review)
    end
  end

  def total_reviews
    json = service.reviews(@params[:id])
    json[:total_results]
  end
end