class Review
  attr_reader :author, 
              :rating, 
              :content
  
  def initialize(attributes)
    @author = attributes[:author]
    @rating = attributes[:rating]
    @content = attributes[:content]
  end
end