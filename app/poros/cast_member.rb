class CastMember
  attr_reader :name, :character
  
  def initialize(member_data)
    @name = member_data[:name]
    @character = member_data[:character]
  end
end
