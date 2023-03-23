require "rails_helper"

RSpec.describe "User's Discover Index", type: :feature do
  before(:each) do
    @stan = User.create!(name: "Stan Johnson", email: "stan@example.com")

    VCR.use_cassette(:top_rated_movies, serialize_with: :json) do
      visit user_discover_index_path(@stan)
    end
  end

  describe "User Story 7" do
    describe "As a user, when I visit a users discover page (/users/:id/discover)" do
      it "I should see a button to 'Find Top Rated Movies" do
        expect(page).to have_button "Find TopRated Movies"

        click_button "Find Top Rated Movies"

        expect(current_path).to eq("/users/#{@stan.id}/discover")
      end
    end
  end
end