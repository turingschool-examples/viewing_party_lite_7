require 'rails_helper'

RSpec.describe Party do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
  end

  describe "instance methods" do
    before(:each) do
      test_data
    end
    describe "guests" do
      it "returns list of users who are not hosting party" do
        expect(@party_1.guests).to eq([@user_2, @user_3])
        expect(@party_2.guests).to eq([@user_4, @user_5])
      end
    end
    describe "format_date" do
      it "returns a formatted date of the party" do
        expect(@party_1.format_date).to eq("May 09, 2023")
        expect(@party_2.format_date).to eq("January 16, 2023")
      end
    end
  end
end
