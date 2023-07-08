require "rails_helper"

RSpec.describe ReviewFacade do
  describe "#show_reviews", :vcr do
    it "shows all movie's reviews" do
      reviews_facade = ReviewFacade.new(238)
      reviews = reviews_facade.show_reviews.all_reviews

      expect(reviews).to be_an(Array)
      expect(reviews.first).to be_a(String)
      expect(reviews.count).to eq(5)
      expect(reviews.last).to eq("Suresh Chidurala's review: Great Movie **Ever**")
    end
  end
end