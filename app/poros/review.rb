class Review
  attr_reader :author
  
  def initialize(author:)
    @author = author
  end
end