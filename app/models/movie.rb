class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :summary, :cast_members, :review_count, :reviews

  def initialize(data, credits = {})
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]

    if data[:genres]
      @runtime = data[:runtime]
      @genres =  data[:genres].map { |g| g[:name] }
      @summary = data[:overview]
      @cast_members = get_cast(credits) 
      @review_count = 0  
      @reviews = []
    end
  end

  private

  def get_cast(credits)
    credits.dig(:cast)&.take(10)&.map { |c| "#{c[:name]} as #{c[:character]}" } 
  end
end
