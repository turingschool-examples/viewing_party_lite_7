require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do

  end

  describe "relationships" do
    it { should have_many(:viewing_parties) }
    it { should belong_to(:user) }
  end
end