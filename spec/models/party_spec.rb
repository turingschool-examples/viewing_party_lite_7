require "rails_helper"

RSpec.describe Party, type: :model do
  let!(:andra) { User.create!(name: "Andra", email: "andra@turing.edu") }
  let!(:hady) { User.create!(name: "Hady", email: "hady@turing.edu") }
  let!(:mike) { User.create!(name: "Mike", email: "mike@turing.edu") }


  let!(:halloween) { Party.create!(name: "Halloween Party", user_id: andra.id, party_date: "10/31/2023", party_time: "10:30", duration: 123) }
  let!(:girls_night) { Party.create!(name: "Girl's Night", user_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:eighties) { Party.create!(name: "Eighties Themed", user_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:other) { Party.create!(name: "Other", user_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }

  let!(:usp1) { UserParty.create!(user_id: andra.id, party_id: halloween.id, invite_status: 0) }
  let!(:usp2) { UserParty.create!(user_id: andra.id, party_id: girls_night.id, invite_status: 0) }
  let!(:usp3) { UserParty.create!(user_id: hady.id, party_id: halloween.id, invite_status: 1) }
  let!(:usp4) { UserParty.create!(user_id: hady.id, party_id: eighties.id, invite_status: 2) }

  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "instance methods" do
    it "list_invitees" do
      expect(halloween.list_invitees).to eq([andra])
      expect(halloween.list_invitees).to_not eq([hady])
    end
  end
end