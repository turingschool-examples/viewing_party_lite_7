class Preview
  attr_reader :original_title,
              :vote_average

  def initialize(preview_data)
    @title = preview_data[:original_title]
    @vote_average = preview_data[:vote_average]
  end
end
