class MoviesFacade
  def initialize(params)
    @params = params
    @details_hash = Hash.new { |hash, key| hash[key] = {} }
  end

  def search_method
    if @params[:q] == "keyword"
      searched_movies(@params[:title])
    else
      top_rated_movies
    end
  end

  def top_rated_movies
    top_rated = MoviesService.top_rated_movies
    top_rated[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def searched_movies(title)
    searched = MoviesService.searched_movies(title)
    searched[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def get_details
    @details ||= MoviesService.movie_details(@params)
  end

  def runtime(_id)
    @details_hash["runtime"] = get_details[:runtime]
  end

  def title(_id)
    @details_hash["title2"] = get_details[:title]
  end

  def vote_average(_id)
    @details_hash["vote_average2"] = get_details[:vote_average]
  end

  def summary(_id)
    @details_hash["summary"] = get_details[:overview]
  end

  def get_genres(_id)
    @details_hash["genres"] = []
    get_details[:genres].each do |genre|
      @details_hash["genres"] << genre[:name]
    end
  end

  def get_reviews(id)
    reviews = MoviesService.reviews(id)
    reviews[:results].each do |review|
      @details_hash["review_info"][review[:author]] = [review[:content], review[:author_details][:rating]]
    end
  end

  def get_review_count(id)
    review_count = MoviesService.reviews(id)
    @details_hash["total_reviews_count"] = review_count[:total_results]
  end

  def get_cast(id)
    cast = MoviesService.credits(id)
    cast[:cast][0..9].each do |person|
      @details_hash["cast"][person[:character]] = person[:name]
    end
  end

  def get_title(_id)
    @details_hash["title2"] = get_details[:title]
  end

  def get_id_show(id)
    @details_hash["id"] = id
  end

  def get_summary(_id)
    @details_hash["summary"] = get_details[:overview]
  end

  def get_vote_average(_id)
    @details_hash["vote_average2"] = get_details[:vote_average]
  end

  def get_image(_id)
    @details_hash["poster_path"] = "http://image.tmb.org/t/p/w500#{get_details[:poster_path]}"
  end

  def detailed_movie
    get_details
    get_image(@params)
    get_id_show(@params)
    get_title(@params)
    get_summary(@params)
    get_vote_average(@params)
    get_cast(@params)
    get_review_count(@params)
    get_reviews(@params)
    get_genres(@params)
    runtime(@params)
    Movie.new(@details_hash)
  end
end
