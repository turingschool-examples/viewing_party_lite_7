require 'rails_helper'
RSpec.describe CastMember do
  before(:each) do
    @cast_member_data = {
      name: 'Christian Bale',
      character: 'Batman'
    }
    @cast_member = CastMember.new(@cast_member_data)
  end
  describe 'initialize' do
    it 'should create a new CastMember' do
      expect(@cast_member).to be_instance_of(CastMember)
      expect(@cast_member.name).to eq('Christian Bale')
      expect(@cast_member.character).to eq('Batman')
    end
  end
end
