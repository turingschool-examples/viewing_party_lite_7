require "rails_helper"

RSpec.describe MovieDbService do

  let(:service) { MovieDbService.new }

  describe "movie_details" do
    it "returns movie details", :vcr do
      result = service.movie_details(100)

      expect(result).to be_a Hash
      expect(result[:title]).to eq("Lock, Stock and Two Smoking Barrels")
    end
  end
end