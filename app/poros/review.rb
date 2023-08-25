class Review
  attr_reader :author,
              :rating,
              :comments

  def initialize(data)
    @author = data[:author]
    @rating = data[:author_details][:rating]
    @comments = format_comments(data[:content])
  end

  def format_comments(comments)
    comments.delete("\n\r")
  end
end
