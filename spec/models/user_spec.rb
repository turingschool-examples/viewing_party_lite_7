require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe "relationships" do
    it { should have_many :viewing_parties }
    it { should have_many(:movies).through(:viewing_parties) }
  end
end