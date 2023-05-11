require './app/poros/cast.rb'

RSpec.describe Cast do
  before(:all) do
    data = {
      name: "AragornActor",
      character: "Aragorn"
      }
    @cast = Cast.new(data)
  end
  describe 'initialize' do
    it 'exists' do
      expect(@cast).to be_a(Cast)
    end

    it 'initializes with attributes' do
      expect(@cast.name).to eq("AragornActor")
      expect(@cast.character).to eq("Aragorn")
    end
  end
end