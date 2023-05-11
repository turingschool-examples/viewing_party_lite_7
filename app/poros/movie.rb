# frozen_string_literal: true

class Movie
  attr_reader :title

  def initialize(attributes)
    @title = attributes[:title]
  end
end
