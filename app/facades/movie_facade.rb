class MovieFacade
  attr_reader :user,
              :movie_id

  def initialize(params)
    @user = User.find(params[:user_id]) if params[:user_id] 
    @movie_id = params[:id]
  end

  def service
    MoviedbService.new
  end

  def movie
    json = service.movie(@movie_id)
    Movie.new(json)
  end

  def movie_cast
    json = service.movie_cast(@movie_id)
    cast = json[:cast][0..9]

    cast.map do |cast_member|
      CastMember.new(cast_member)
    end
  end

  def movie_reviews_hash
    json = service.movie_reviews(@movie_id)

    json[:results].map do |review|
      h = Hash.new
      h[:author] = review[:author]
      h[:content] = review[:content]
      h[:created_at] = review[:created_at]
    
      h
    end
  end

  def movie_reviews
    movie_reviews_hash.map do |review|
      Review.new(review)
    end
  end

end