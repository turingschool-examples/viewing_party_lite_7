class Preview
  attr_reader :title,
              :vote,
              :id

  def initialize(preview_data)
    @title = preview_data[:original_title]
    @vote = preview_data[:vote_average]
    @id = preview_data[:id]
  end
end
