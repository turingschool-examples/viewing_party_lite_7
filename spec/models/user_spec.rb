require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :user_viewing_parties}
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe "#user_host_name" do
    it "can return the name of a user given their id" do
      user_1 = User.create!(name: "Jamie", email: "34@gmail.com")

      query = User.user_host_name(user_1.id)

      expect(query).to eq("Jamie")
    end
  end
end