class MovieFacade
  attr_reader :user, :movie_results

  def initialize(params)
    @user = User.find(params[:user_id])
    @movie_results = params[:movie_title]
  end

  def service
    MoviedbService.new
  end

  def request_type
    if @movie_results.present?
      "search"
    else
      "top_rated"
    end
  end
  
  def top_rated_movies
    json = service.top_rated_movies
    
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search_results
    json = service.search_results(@movie_results)

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end