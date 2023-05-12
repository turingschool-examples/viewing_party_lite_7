class Movie
  attr_reader :id, :title, :vote_average, :poster_path, :runtime, :genres, :summary, :cast_members, :review_count, :reviews

  def initialize(data, credits = {}, reviews = [])
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @poster_path = data[:poster_path]

    if data[:genres]
      @runtime = data[:runtime]
      @genres =  data[:genres].map { |g| g[:name] }
      @summary = data[:overview]
      @cast_members = get_cast(credits) 
      @review_count = reviews.size  
      @reviews = format_reviews(reviews)
    end
  end

  private

  def get_cast(credits)
    credits.dig(:cast)&.take(10)&.map { |c| "#{c[:name]} as #{c[:character]}" } 
  end

  def format_reviews(reviews)
    reviews.map do |review|
      {
        author: review[:author],
        url: review[:url]
      }
    end
  end
end
