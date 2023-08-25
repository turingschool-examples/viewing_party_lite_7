require "rails_helper"

RSpec.describe Cast do
  describe "cast class" do
    it "exists and has attributes" do
      data = {  name: "Al Pacino",
                character: "Tony Montana"
              }
      cast = Cast.new(data)
      
      expect(cast).to be_a(Cast)
      expect(cast.name).to eq("Al Pacino")
      expect(cast.character).to eq("Tony Montana")
    end
  end
end