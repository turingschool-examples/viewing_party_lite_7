# frozen_string_literal: true

class CastMember
  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
  end
end
