require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  
  describe "#methods" do
    context '#pretty_day' do
      it 'returns the day in a more readable form' do
        test_data
        party_test_data
        expect(@party1.pretty_day).to eq("January 23, 2023")
      end
    end

    context "#pretty_time" do
      it "can find the date in readable format" do
        party = Party.create!(movie_title: "E.T.", duration: 120, start_time: "8:00:00")
        expect(party.pretty_time).to eq("08:00 AM")
      end
    end

    context "#duration_in_hours_and_minutes" do
      it "can find the duration in 0h 0min format" do
        party = Party.create!(movie_title: "E.T.", duration: 90, day: "01-21-23", start_time: "2012-03-27 14:54:09")
        expect(party.duration_in_hours_and_minutes).to eq("1h 30min")
      end
    end
  end

  describe '#pretty_time' do
  it 'returns the time in a more readable form' do
    test_data
    expect(@party1.pretty_time).to eq(" 8:00 AM")
  end
end
end