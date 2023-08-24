class Review
  attr_reader :author,
              :rating,
              :comments
  def initialize(data)
    @author = data[:author]
    @rating = data[:author_details][:rating]
    @comments = data[:content]
  end
end