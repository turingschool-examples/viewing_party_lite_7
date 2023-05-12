require 'rails_helper'

RSpec.describe Cast do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = { name: 'Edward Norton', character: 'The Narrator' }
      cast = Cast.new(data)

      expect(cast).to be_a(Cast)
      expect(cast.name).to eq('Edward Norton')
      expect(cast.character).to eq('The Narrator')
    end

    it 'can create another object' do
      data = { name: 'Keanue Reeves', character: 'John Wick' }
      cast = Cast.new(data)

      expect(cast).to be_a(Cast)
      expect(cast.name).to eq('Keanue Reeves')
      expect(cast.character).to eq('John Wick')
    end
  end
end