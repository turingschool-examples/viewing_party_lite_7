class CastMapper
  def self.map_cast_details(cast_data)
    cast_data["cast"][0..9].map do |cast_member|
      CastMember.new(
        name: cast_member["name"],
        character: cast_member["character"]
      )
    end
  end
end