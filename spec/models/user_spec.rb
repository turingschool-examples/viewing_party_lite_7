require "rails_helper"

RSpec.describe User, type: :model do
  let!(:andra) { User.create!(name: "Andra", email: "andra@turing.edu") }
  let!(:hady) { User.create!(name: "Hady", email: "hady@turing.edu") }

  let!(:halloween) { Party.create!(name: "Halloween Party", host_id: hady.id, party_date: "10/31/2023", party_time: "10:30", duration: 123) }
  let!(:girls_night) { Party.create!(name: "Girl's Night", host_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:eighties) { Party.create!(name: "Eighties Themed", host_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:other) { Party.create!(name: "Other", host_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }

  let!(:usp1) { UserParty.create!(user_id: andra.id, party_id: halloween.id) }
  let!(:usp2) { UserParty.create!(user_id: andra.id, party_id: girls_night.id) }
  let!(:usp3) { UserParty.create!(user_id: andra.id, party_id: eighties.id) }
  let!(:usp4) { UserParty.create!(user_id: hady.id, party_id: eighties.id) }


  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe "instance methods" do
    it "matched_parties" do
      expect(andra.matched_parties).to eq([halloween, girls_night, eighties])
      expect(andra.matched_parties).to_not eq([other])
    end
  end
end