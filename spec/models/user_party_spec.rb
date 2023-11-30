require "rails_helper"

RSpec.describe UserParty, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :party}
  end

  before(:each) do
    load_test_data
  end

  it "#get_user_name" do
    expect(@user_party1.get_user_name).to eq("Tom")
  end
end