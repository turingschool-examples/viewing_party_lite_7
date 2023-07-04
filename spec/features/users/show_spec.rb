require "rails_helper"

RSpec.describe "/users/:id" do
  describe "As a visitor" do
    describe "when I visit the users show page" do
      let!(:user_1) { create(:user) }
      let!(:user_2) { create(:user) }

      let!(:movie_1) { create(:movie) }
      let!(:movie_2) { create(:movie) }
      let!(:movie_3) { create(:movie) }

      let!(:wapa_1) { create(:watch_party) }
      let!(:wapa_2) { create(:watch_party) }
      let!(:wapa_3) { create(:watch_party) }

      let!(:movie_watch_party_1) { create(:movie_watch_party, watch_parties_id: wapa_1.id, users_id: user_1.id, movies_id: movie_1.id) }
      let!(:movie_watch_party_2) { create(:movie_watch_party, watch_parties_id: wapa_2.id, users_id: user_1.id, movies_id: movie_2.id) }
      let!(:movie_watch_party_3) { create(:movie_watch_party, watch_parties_id: wapa_3.id, users_id: user_1.id, movies_id: movie_3.id) }

      it "displays the user's name at the top of the page" do
        visit user_path(user_1)
        expect(page).to have_content("#{user_1.name}'s Dashboard")
        expect(page).to_not have_content("#{user_2.name}'s Dashboard")

        visit user_path(user_2)
        expect(page).to have_content("#{user_2.name}'s Dashboard")
        expect(page).to_not have_content("#{user_1.name}'s Dashboard")
      end

      it "displays a button to discover movies" do
        visit user_path(user_1)
        expect(page).to have_button("Discover Movies")
        click_button "Discover Movies"
        expect(current_path).to eq(user_discover_index_path(user_1))
      end

      it "has a section that lists viewing parties" do
        visit user_path(user_1)
        expect(page).to have_content("#{user_1.name}'s Watch Parties")
        require 'pry'; binding.pry
      end
    end
  end
end