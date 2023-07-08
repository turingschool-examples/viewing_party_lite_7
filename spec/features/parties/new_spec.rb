require "rails_helper"

RSpec.describe "Create watch party" do
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

  describe "As a visitor when I visit movie show page" do
    it "can display a button to make a new movie", :vcr do
      visit "/users/#{user_1.id}/movies/455476"
      click_button "Create Watch Party"
      expect(current_path).to eq("/users/#{user_1.id}/movies/455476/viewing-party/new")
    end
    it "can create new controller", :vcr do
      movie = MovieService.new.movie_by_id(455476)
      visit "/users/#{user_1.id}/movies/455476/viewing-party/new"
      fill_in(:date, with: "8/8/23")
      fill_in(:duration, with: 120)
      fill_in(:start_time, with: "13:00")
      find("#movie_title", visible: false).set("Knights of the Zodiac")
      click_button "Save"
      expect(current_path).to eq("/users/#{user_1.id}")
      expect(page).to have_content("Date: 8/8/23")
    end

    it "can display movie details on watch party create page", :vcr do
      movie = MovieService.new.movie_by_id(455476)
      actor = MovieService.new.movie_cast(455476)
      visit "/users/#{user_1.id}/movies/455476/viewing-party/new"

      expect(page).to have_content("Knights of the Zodiac")
      expect(page).to have_content("Length: 112")
      expect(page).to have_content("Vote Average: 6.549")

    end
  end
end