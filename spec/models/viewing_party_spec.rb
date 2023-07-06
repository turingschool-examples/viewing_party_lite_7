require "rails_helper"

RSpec.describe ViewingParty do
  describe "validations" do
    it { should validate_presence_of :duration}
    it { should validate_presence_of :date_time}
    it { should validate_numericality_of :duration}
  end

  describe "relationships" do
    it {should have_many :viewing_users}
    it {should have_many(:users).through(:viewing_users)}
  end
end