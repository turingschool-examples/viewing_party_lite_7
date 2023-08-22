require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :viewing_parties }
    it { should have_many(:movies).through(:viewing_parties) }
  end
end