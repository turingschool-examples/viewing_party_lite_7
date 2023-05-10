class Movie 
  attr_reader :title,
              :rating,
              :runtime,
              :genre,
              :summary,
              :cast_members,
              :review_count,
              :reviews
  def initialize(data)
    @title = data[:title]
    @rating = data[:vote_average]
    @runtime = data[:runtime]
    
  end
       
end