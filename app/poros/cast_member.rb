class CastMember

  attr_reader :name,
              :character

  def initialize(cast_member_params)
    @name = cast_member_params[:name]
    @character = cast_member_params[:character]
  end
end