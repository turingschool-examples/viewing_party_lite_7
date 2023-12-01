require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "#methods" do
    context "#long_hand_date" do
      it "can find the date in longhand format" do
        party = Party.create!(movie_title: "E.T.", duration: 120, start_time: "2001-01-01 8:00:00")
        expect(party.long_hand_date).to eq("January 1st, 2000 08:00")
      end
    end

    context "#duration_in_hours_and_minutes" do
      it "can find the duration in 0h 0min format" do
        party = Party.create!(movie_title: "E.T.", duration: 90, when: "01-21-23", start_time: "2012-03-27 14:54:09")
        expect(party.duration_in_hours_and_minutes).to eq("1h 30min")
      end
    end
  end
end