class UserFacade 
  attr_reader :details, :reviews, :credits 

   def initialize(search, top_rated)
    @search = search
    @top_rated = top_rated
  end

  def determine_search 
    if @top_rated == "true" && @search == nil 
      all_top_rated_call
    else 
      all_search_call
    end
  end

  def top_rated_call
    parsed_top_rated = service.top_rated_call

    @movie_results = parsed_top_rated[:results].map do |result|
      Movie.new(result)
    end[0..19]
  end

  def all_top_rated_call 
    @_all_top_rated_call ||= top_rated_call
  end

  def search_call
    parsed_movie_title_search = service.search_call(@search)

    @movie_results = parsed_movie_title_search[:results].map do |result|
      Movie.new(result)
    end[0..19]
  end

  def all_search_call 
    @_all_search_call ||= search_call
  end

  def get_movie_details(movie_id)
    
    parsed_details = service.details_call(movie_id)
    parsed_credits = service.credits_call(movie_id)
    parsed_reviews = service.reviews_call(movie_id)
    
    initialized_params = {:id => movie_id, 
                          :original_title => parsed_details[:original_title],
                          :vote_average => parsed_details[:vote_average]
                          }
   
    movie = Movie.new(initialized_params)

    @details = movie.get_details(parsed_details)
    @reviews = movie.get_reviews(parsed_reviews)
    @credits = movie.get_credits(parsed_credits) 
  end

  def service 
     @_service ||= MovieService.new 
  end
end