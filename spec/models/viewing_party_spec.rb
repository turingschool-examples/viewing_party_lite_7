require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do

  end

  describe 'relationships' do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
    it { should have_many(:viewing_party_users)}
    it {should have_many(:users).through(:viewing_party_users)}
  end
end
