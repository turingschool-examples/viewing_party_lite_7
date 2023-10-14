require 'rails_helper'

RSpec.describe CastMember do
  describe 'initialize' do
    it 'sets attributes correctly' do
      member_data = { name: 'John Smith', character: 'Character 1' }
      cast_member = CastMember.new(member_data)

      expect(cast_member.name).to eq('John Smith')
      expect(cast_member.character).to eq('Character 1')
    end
  end
end
