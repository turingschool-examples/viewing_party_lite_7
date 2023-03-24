class Review
  attr_reader :author, :content, :created_at

  def initialize(data)
    @author = data[:author]
    @content = data[:content]
    @created_at = data[:created_at]
  end
end