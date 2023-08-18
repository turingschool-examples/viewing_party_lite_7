require "rails_helper"

RSpec.describe "/users/:id" do
  describe "As a visitor" do
    describe "when I visit the users discover page" do
      let!(:user_1) { create(:user) }
      let!(:user_2) { create(:user) }
      let!(:user_3) { create(:user) }

      let!(:wapa_1) { create(:watch_party) }
      let!(:wapa_2) { create(:watch_party) }
      let!(:wapa_3) { create(:watch_party) }

      let!(:movie_watch_party_1) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_1.id) }
      let!(:movie_watch_party_2) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_2.id) }
      let!(:movie_watch_party_3) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_3.id) }

      let!(:movie_watch_party_4) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_1.id) }
      let!(:movie_watch_party_5) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_2.id) }
      let!(:movie_watch_party_6) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_3.id) }

      let!(:movie_watch_party_7) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_1.id) }
      let!(:movie_watch_party_8) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_2.id) }
      let!(:movie_watch_party_9) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_3.id) }
      let!(:movie_watch_party_10) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_3.id) }

      it "allows to search for movie by title", :vcr do

        MovieService.new.search_movie_by_keyword("dog")
        visit "/users/#{user_1.id}/discover"
        fill_in :search, with: "dog"
        click_button "Search"
        expect(current_path).to eq("/users/#{user_1.id}/movies")

        # expect(page).to have_content("Movie: Dogtanian and the Three Muskehounds")
        # expect(page).to have_content("Movie: Norm Macdonald: Hitler's Dog, Gossip & Trickery")

      end

      it "displays a button to Discover Top Rated Movies", :vcr do
        visit "/users/#{user_1.id}/discover"
        expect(page).to have_button("Top Rated Movies")
        click_button "Top Rated Movies"
        expect(current_path).to eq("/users/#{user_1.id}/movies")
      end

      it "has a text field and button to enter keywords and search by movie title", :vcr do
        visit "/users/#{user_1.id}/discover"
        expect(page).to have_field(:search)
        expect(page).to have_button("Search")

        fill_in(:search, with: "V for Vendetta")
        click_button "Search"

        expect(current_path).to eq("/users/#{user_1.id}/movies")
      end
    end
  end
end