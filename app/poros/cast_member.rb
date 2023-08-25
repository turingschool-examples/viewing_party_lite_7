class CastMember
  attr_reader :name, :character

  def initialize(name:, character:)
    @name = name
    @character = character
  end
end