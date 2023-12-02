require "rails_helper"

RSpec.describe UserParty, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :party }
  end

  describe "#methods" do
    before :each do
      test_data
      oppenheimer_test_data
      missing_poster_test_data
      placeholder_poster_test_data
      @party4 = Party.create!(movie_title: "E.T.", duration: 120, day: Date.new(2023, 1, 23), start_time: "08:00", movie_id: 1209375)
      @user_party1 = UserParty.create!(user_id: @user1.id, party_id: @party4.id, host_id: @user1.id, host: true)
      @party5 = Party.create!(movie_title: "E.T.", duration: 120, day: Date.new(2023, 1, 23), start_time: "08:00", movie_id: 872585)
      @user_party2 = UserParty.create!(user_id: @user1.id, party_id: @party5.id, host_id: @user1.id, host: true)
    end

    describe "#movie_poster_file_path" do
      it "finds the file path for a movie" do
        expect(@user_party2.movie_poster_file_path).to eq("/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg")
      end

      context "sad path" do
        it "provides an alternative if no poster found" do
          expect(@user_party1.movie_poster_file_path).to eq("/oZd7EHBbB7NEXkCmeOozz6EBE03.jpg")
        end
      end
    end
  end
end