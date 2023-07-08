require 'rails_helper'

RSpec.describe CastMember do 
  before(:each) do 
    @actor = CastMember.new({
      name: 'Jeremicah'
    })
  end

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(@actor).to be_a CastMember
      expect(@actor.name).to eq('Jeremicah')
    end
  end
end