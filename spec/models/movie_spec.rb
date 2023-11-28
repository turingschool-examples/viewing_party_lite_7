require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should have_many(:viewing_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:vote) }
    it { should validate_presence_of(:cast) }
    it { should validate_presence_of(:reviews) }
  end
end
