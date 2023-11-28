require "rails_helper"

RSpec.describe User, type: :model do
  # before :each do
  #   test_data
  # end
  
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
    it { should have_many(:movies).through(:parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

  end
end