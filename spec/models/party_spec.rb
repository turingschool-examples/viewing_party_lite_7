require 'rails_helper'

RSpec.describe Party do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
  end
  
end
