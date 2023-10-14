require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  before(:each) do
    load_test_data
  end

  it "#get_host_name" do
    expect(@party1.get_host_name).to eq("Tom")
  end
end