require "rails_helper"

RSpec.describe MovieFacade do
  let(:facade1) { MovieFacade.new(
      id: 1,
      user_id: 2,
      commit: "Find Movies",
      search: "Spaceballs"
    ) }

  describe "initialize" do
    it "exists" do
      expect(facade1).to be_a MovieFacade
    end

    it "initializes with attributes" do
      expect(facade1.movie_id).to eq(1)
      expect(facade1.user_id).to eq(2)
      expect(facade1.commit).to eq("Find Movies")
      expect(facade1.title).to eq("Spaceballs")
    end
  end
end
