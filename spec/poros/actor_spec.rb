require 'rails_helper'

RSpec.describe 'Actor' do
  before :each do
    @actor = Actor.new({name: 'Brad Pitt', character: 'Tyler Durden'})
  end

  describe 'exists' do
    it 'has attributes' do 
      expect(@actor).to be_a(Actor)
      expect(@actor.name).to eq('Brad Pitt')
      expect(@actor.character).to eq('Tyler Durden')
    end
  end
end