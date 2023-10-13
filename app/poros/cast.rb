# frozen_string_literal: true

# app/poros/cast.rb
class Cast
  attr_reader :character, :name

  def initialize(data)
    @character = data[:character]
    @name = data[:name]
  end
end
