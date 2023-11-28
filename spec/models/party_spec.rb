require "rails_helper"

RSpec.describe Party, type: :model do
  # before :each do
  #   test_data
  # end
  
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
    it { should have_many(:party_movies) }
    it { should have_many(:movies).through(:party_movies) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }

  end
end