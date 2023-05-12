require 'rails_helper'

RSpec.describe 'Cast' do
  before :each do
    @cast = Cast.new({name: 'Brad Pitt', character: 'Tyler Durden'})
  end

  describe 'exists' do
    it 'has attributes' do 
      expect(@cast).to be_a(Cast)
      expect(@cast.name).to eq('Brad Pitt')
      expect(@cast.character).to eq('Tyler Durden')
    end
  end
end