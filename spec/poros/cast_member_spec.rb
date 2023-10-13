# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CastMember do
  describe 'intialize' do
    it 'creates a cast member object' do
      cast_member_data = {
        name: 'Gary Sinise',
        character: 'Lt. Dan Taylor'
      }
      cast_member = CastMember.new(cast_member_data)
      expect(cast_member).to be_a(CastMember)
      expect(cast_member.name).to eq('Gary Sinise')
      expect(cast_member.character).to eq('Lt. Dan Taylor')
    end
  end
end
