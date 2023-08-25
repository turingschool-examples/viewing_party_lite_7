class CastMember
  attr_reader :name, :character

  def initialize(info)
    @name = info[:name]
    @character = info[:character]
  end
end