require "rails_helper"

RSpec.describe Party, type: :model do
  before(:each) do
    load_test_data
  end

  describe '#validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
  end

  describe '#relations' do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end

  it "#get_host_name" do
    expect(@party1.get_host_name).to eq("Capitainlearyo")
  end
end