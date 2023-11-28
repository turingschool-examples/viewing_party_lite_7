require "rails_helper"

RSpec.describe Movie, type: :model do
  # before :each do
  #   test_data
  # end
  
  describe "relationships" do
    it { should have_many(:party_movies) }
    it { should have_many(:parties).through(:party_movies) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:runtime) }

  end
end