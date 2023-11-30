class MovieReview
  attr_reader :author, :content

  def initialize(cast_data)
    @author = cast_data[:author]
    @content = cast_data[:content]
  end
end