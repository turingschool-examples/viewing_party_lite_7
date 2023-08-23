require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

  end

  describe "relationships" do
    it { should have_many(:movies_users) }
    it { should have_many(:movies).through(:movies_users) }
    it { should have_many(:users_viewing_parties) }
    it { should have_many(:viewing_parties).through(:users_viewing_parties) }
  end
end