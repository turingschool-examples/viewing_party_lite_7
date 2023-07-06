require "rails_helper"

RSpec.describe MovieWatchParty, type: :model do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }

  let!(:movie_1) { create(:movie) }
  let!(:movie_2) { create(:movie) }
  let!(:movie_3) { create(:movie) }

  let!(:wapa_1) { create(:watch_party, movie_id: movie_1.id) }
  let!(:wapa_2) { create(:watch_party, movie_id: movie_2.id) }
  let!(:wapa_3) { create(:watch_party, movie_id: movie_3.id) }

  let!(:movie_watch_party_1) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_1.id) }
  let!(:movie_watch_party_2) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_2.id) }
  let!(:movie_watch_party_3) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_3.id) }

  let!(:movie_watch_party_4) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_1.id) }
  let!(:movie_watch_party_5) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_2.id) }
  let!(:movie_watch_party_6) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_3.id) }

  let!(:movie_watch_party_7) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_1.id) }
  let!(:movie_watch_party_8) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_2.id) }
  let!(:movie_watch_party_9) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_3.id) }


  describe "relationships" do
    describe "associations" do
      it { should belong_to :user }
      it { should define_enum_for(:user_status).with_values(attending: 0, hosting: 1) }
    end
  end

  describe "class methods" do
    describe ".sort_attending" do
      it "filters the movie watch parties by user_status where the status is attending" do
        movie_watch_party_1.update(user_status: 0)
        movie_watch_party_2.update(user_status: 1)
        movie_watch_party_3.update(user_status: 0)

        movie_watch_party_4.update(user_status: 0)
        movie_watch_party_5.update(user_status: 1)
        movie_watch_party_6.update(user_status: 0)

        movie_watch_party_7.update(user_status: 1)
        movie_watch_party_8.update(user_status: 1)
        movie_watch_party_9.update(user_status: 1)

        expect(MovieWatchParty.sort_attending).to match_array([movie_watch_party_1, movie_watch_party_3, movie_watch_party_4, movie_watch_party_6])
      end
    end

    describe ".sort_hosting" do
      it "filters the movie watch parties by user_status where the status is hosting" do
        movie_watch_party_1.update(user_status: 0)
        movie_watch_party_2.update(user_status: 1)
        movie_watch_party_3.update(user_status: 0)

        movie_watch_party_4.update(user_status: 0)
        movie_watch_party_5.update(user_status: 1)
        movie_watch_party_6.update(user_status: 0)

        movie_watch_party_7.update(user_status: 1)
        movie_watch_party_8.update(user_status: 1)
        movie_watch_party_9.update(user_status: 0)

        expect(MovieWatchParty.sort_hosting).to match_array([movie_watch_party_2, movie_watch_party_5, movie_watch_party_7, movie_watch_party_8])
      end
    end
  end
end
