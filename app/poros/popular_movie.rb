class PopularMovie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast
  def initialize(movie)
    @id             = movie[:id]
    @title          = movie[:title]
    @vote_average   = movie[:vote_average]
    @runtime        = movie[:runtime] 
    @genres         = movie[:genres] 
    @overview       = movie[:overview]
    @cast           = movie[:cast]
    @review_count   = movie[:reviews]
    @reviewers      = movie[:reviews]
  end

  def convert_minutes(minutes)
    hours = @runtime / 60
    remaining_minutes = @runtime % 60
    "#{hours} hours #{remaining_minutes} minutes"
  end
end