require "rails_helper"

describe ViewingParty, type: :model do
  describe "relationship" do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe "validations" do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :party_date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :movie_id }
  end
end