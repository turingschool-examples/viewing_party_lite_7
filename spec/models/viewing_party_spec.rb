require "rails_helper"

RSpec.describe ViewingParty, type: :model do
  describe "relationships" do
    it { should belong_to(:movie) }
    it { should have_many(:party_users) }
  end

  describe "validations" do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:host_id) }
    it { should validate_presence_of(:movie_id) }
  end
end
