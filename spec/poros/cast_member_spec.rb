require 'rails_helper'

RSpec.describe CastMember do
  it 'exists and has attributes' do
    data = {
            name: 'Kevin Bacon',
            character: 'Earl'
          }
    cast_member = CastMember.new(data)

    expect(cast_member).to be_a(CastMember)
    expect(cast_member.name).to be_a(String)
    expect(cast_member.character).to be_a(String)

    expect(cast_member.name).to eq('Kevin Bacon')
    expect(cast_member.character).to eq('Earl')
  end
end