class Movie
  attr_reader :id, :title, :vote_average, 
              :poster_path, :runtime, :genres, :summary, 
              :cast_members, :review_count, :reviews

  def initialize(info, credits = {}, reviews = [])
    @id = info[:id]
    @title = info[:title]
    @vote_average = info[:vote_average]
    @poster_path = info[:poster_path]

    if info[:genres]
      @runtime = info[:runtime]
      @genres =  info[:genres].map { |g| g[:name] }
      @summary = info[:overview]
      @cast_members = get_cast(credits) 
      @review_count = reviews.size  
      @reviews = get_reviews(reviews)
    end
  end

  private

  def get_cast(credits)
    credits[:cast].first(10).map do |credit|
       "#{credit[:name]} as #{credits[:character]}"
    end
  end

  def get_reviews(reviews)
    reviews.map do |review|    
      { author: review[:author], url: review[:url] }
    end
  end
end
