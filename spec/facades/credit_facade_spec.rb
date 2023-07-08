require "rails_helper"

RSpec.describe CreditFacade do
  describe "#shows_credits", :vcr do
    it "can show first 10 movie credits" do
      credits = CreditFacade.new(238)
      all_cast = credits.show_credits.cast

      expect(all_cast).to be_an(Array)
      expect(all_cast.first).to eq(["Marlon Brando", "Don Vito Corleone"])
      expect(all_cast.first).to be_an(Array)
      expect(all_cast.count).to eq(10)
    end
  end
end