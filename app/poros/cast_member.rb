class CastMember 
  attr_reader :name, :gender, :character

  def initialize(data)
    @name = data[:name]
    @gender = data[:gender]
    @character = data[:character]
  end
end