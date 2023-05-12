require 'rails_helper'

RSpec.describe User do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "instance methods" do
    before do
      test_data
    end

    it "#no_parties?" do
      expect(@user_1.no_parties?).to eq(true)
      expect(@user_2.no_parties?).to eq(false)
    end

    it "host_vps" do
      expect(@user_1.host_vps).to eq([])
      expect(@user_3.host_vps).to eq([@party_2])
      expect(@user_4.host_vps).to eq([@party_1])
    end

    it "guest_vps" do
      expect(@user_1.guest_vps).to eq([])
      expect(@user_3.guest_vps).to eq([@party_1])
      expect(@user_4.guest_vps).to eq([@party_2])
    end
  end
end
