class Review
  attr_reader :author,
              :content

  def initialize(info)
    @author = info[:author]
    @content = info[:content]
  end
end