require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
  describe 'relationships' do
    it { should have_many(:viewing_parties) }
    it { should have_many(:party_guests) }
    it { should have_many(:viewing_parties).through(:party_guests) }
  end
  describe '#potential_guests(host_id)' do
    it 'finds all current Users in the system, besides the User with the given ID' do
      kam = User.create!(name: "Kam", email: "doofus23@gmail.com")
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      expect(User.potential_guests(kam.id)).to_not include(kam)
      expect(User.potential_guests(kam.id)).to match_array([user1, user2, user3, user4])
    end
  end
end
