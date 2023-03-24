class MovieFacade
  attr_reader :user,
              :movie_id

  def initialize(params)
    @user = User.find(params[:user_id])
    @movie_id = params[:id]
  end

  def service
    MoviedbService.new
  end

  def movie
    Movie.new(combine)
  end

  def movie_info
    json = service.movie(@movie_id)
  end

  def movie_cast
    json = service.movie_cast(@movie_id)
  end

  def movie_reviews
    json = service.movie_reviews(@movie_id)
  end

  def combine
    movie_hash = movie_info
    movie_hash[:cast] = movie_cast[:cast][0..9]
    
    reviews = movie_reviews[:results].map do |review|
      h = Hash.new
      h[:author] = review[:author]
      h[:content] = review[:content]
      h[:created_at] = review[:created_at]
      
      h
    end
    movie_hash[:reviews] = reviews

    movie_hash
  end
end