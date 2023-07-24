require "rails_helper"

RSpec.describe "top rated movies" do
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

  describe "As a visitor to top rated movies" do
    it "can display movie by popularity", :vcr do
      movies = MovieService.new.popular_movies
      visit user_movies_path(user_id: user_1.id, movie_id: 455476)
    end
  end
end