require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:party_users) }
    it { should have_many(:viewing_parties).through(:party_users) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context "when condition" do
    it "succeeds" do
      pending "Not implemented"
    end
  end
end
