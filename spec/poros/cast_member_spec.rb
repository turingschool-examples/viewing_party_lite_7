require 'rails_helper'

describe CastMember do
  before :each do
    cast_member_data = {
      "adult": false,
      "gender": 2,
      "id": 3084,
      "known_for_department": "Acting",
      "name": "Marlon Brando",
      "original_name": "Marlon Brando",
      "popularity": 14.838,
      "profile_path": "/fuTEPMsBtV1zE98ujPONbKiYDc2.jpg",
      "cast_id": 5,
      "character": "Don Vito Corleone",
      "credit_id": "52fe422bc3a36847f8009357",
      "order": 0
  }
  @cast_member = CastMember.new(cast_member_data)
  end

  it 'exists' do
    expect(@cast_member).to be_an_instance_of(CastMember)
    expect(@cast_member.name).to eq("Marlon Brando")
    expect(@cast_member.gender).to eq(2)
    expect(@cast_member.character).to eq("Don Vito Corleone")
  end
end