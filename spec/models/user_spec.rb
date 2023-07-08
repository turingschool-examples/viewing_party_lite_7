require "rails_helper"

RSpec.describe User do
  before :each do
    @user_1 = User.create!(name: "Cody", email: "code@gmail.com")
    @user_2 = User.create!(name: "Javen", email: "javenb022@gmail.com")

    @party_1 = Party.create!(movie_id: 1, duration: 120, date: "2021-07-06", start_time: "2021-07-06 12:00:00")
    @party_2 = Party.create!(movie_id: 2, duration: 120, date: "2021-07-06", start_time: "2021-07-06 12:00:00")
    @party_3 = Party.create!(movie_id: 3, duration: 120, date: "2021-07-06", start_time: "2021-07-06 12:00:00")

    @user_party_1 = UserParty.create!(user_id: @user_1.id, party_id: @party_1.id, is_host: true)
    @user_party_2 = UserParty.create!(user_id: @user_1.id, party_id: @party_2.id, is_host: nil)
    @user_party_3 = UserParty.create!(user_id: @user_2.id, party_id: @party_1.id, is_host: nil)
    @user_party_4 = UserParty.create!(user_id: @user_2.id, party_id: @party_2.id, is_host: true)
    @user_party_5 = UserParty.create!(user_id: @user_1.id, party_id: @party_3.id, is_host: nil)
  end
  describe "instance methods" do
    describe "#invited_parties" do
      it "returns all parties a user is invited to" do
        expect(@user_1.invited_parties).to eq([@party_2, @party_3])
      end
    end
  end
end