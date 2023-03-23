class MoviesFacade

  def initialize(params)
    @params = params
    @details_hash = Hash.new { |hash, key| hash[key] = {} }
  end

  def search_method
    if @params[:q] == "keyword"
      searched_movies(@params[:title])   
    elsif @params[:q] == "details"
      movie_details(params[:id])
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
    @details ||= MovieService.movie_details(id)
  end

  def self.runtime(id)
    @details_hash["runtime"] = get_details[:runtime]
  end

  def self.title(id)
    @details_hash["title"] = get_details[:title]
  end

  def self.vote_average(id)
    @details_hash["vote_average"] = get_details[:vote_average]
  end

  def self.summary(id)
    @details_hash["summary"] = get_details[:overview]
  end

  def self.get_genres(id)
    @details_hash["genres"] = []
    get_details[:genres].each do |genre|
      @details_hash["genres"] << genre[:name]
    end
  end

  def self.get_reviews(id)
    reviews = MovieService.reviews(id)
    reviews[:results].each do |review|
       @details_hash["review_info"][review[:author]] = [review[:content], review[:author_details][:rating]]
     end
  end

  def self.get_review_count(id)
    review_count = MovieService.reviews(id)
    @details_hash["total_reivews_count"] = review_count[:total_results]
  end

  def self.get_cast(id)
    cast = MovieService.credits(id)
    cast[:cast][0..9].each do |person|
      @details_hash["cast"][person[:character]] = person[:name]
    end
  end

  def detailed_movie
    Movie.new(@details_hash)
  end
end
