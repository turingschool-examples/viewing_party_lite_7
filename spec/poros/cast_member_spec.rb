require "rails_helper"


RSpec.describe CastMember do
  it "exists and has attributes" do
    attrs = {
      "name": "Marlon Brando",
      "character": "Don Vito Corleone",
    }

    cast_member = CastMember.new(attrs)

    expect(cast_member).to be_a CastMember

    expect(cast_member.name).to eq("Marlon Brando")
    expect(cast_member.character).to eq("Don Vito Corleone")
  end
end