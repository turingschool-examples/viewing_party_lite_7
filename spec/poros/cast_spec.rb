require "rails_helper"

RSpec.describe Cast do
  describe "initialize" do
    let(:data) do
      {
        name: "Jason Statham",
        character: "Bacon"
      }
    end

    it "creates a cast object" do
      cast = Cast.new(data)
      
      expect(cast).to be_a(Cast)
      expect(cast.name).to eq("Jason Statham")
      expect(cast.character).to eq("Bacon")
    end
  end
end