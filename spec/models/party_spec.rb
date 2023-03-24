require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :duration_minutes }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :date }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
  end

  describe "relationships" do
    it { should have_many :party_users }
    it { should have_many(:users).through(:party_users) }
  end

  describe "instance variables" do
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com")

      @party1 = Party.create!(duration_minutes: 143, start_time: "08:00", date: Date.parse("2023-01-01"), movie_id: 62, host_id: @picard.id)
      @party2 = Party.create!(duration_minutes: 90, start_time: "10:30", date: Date.parse("2023-02-02"), movie_id: 238, host_id: @riker.id)

      PartyUser.create!(party_id: @party1.id, user_id: @picard.id, host_id: @party1.host_id)
      PartyUser.create!(party_id: @party1.id, user_id: @data.id, host_id: @party1.host_id)

      PartyUser.create!(party_id: @party2.id, user_id: @picard.id, host_id: @party2.host_id)
      PartyUser.create!(party_id: @party2.id, user_id: @riker.id, host_id: @party2.host_id)
      PartyUser.create!(party_id: @party2.id, user_id: @data.id, host_id: @party2.host_id)
    end

    # Doesn't work yet
    # it "#invitee_names" do
    #   expect(@party1.invitee_names).to eq([@data.name])
    #   expect(@party1.invitee_names).to_not eq([@data.name, @picard.name])

    #   expect(@party2.invitee_names).to eq([@data.name, @picard.name])
    #   expect(@party1.invitee_names).to_not eq([@data.name, @picard.name, @riker.name])
    # end
  end
end