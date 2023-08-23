require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do

  end

  describe "relationships" do
    it { should have_many(:movies_users) }
    it { should have_many(:users).through(:movies_users) }
  end
end