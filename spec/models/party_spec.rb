require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe '#pretty_day' do
    it 'returns the day in a more readable form' do
      test_data
      expect(@party1.pretty_day).to eq("January 23, 2023")
    end
  end

  describe '#pretty_time' do
  it 'returns the time in a more readable form' do
    test_data
    expect(@party1.pretty_time).to eq(" 8:00 AM")
  end
end
end