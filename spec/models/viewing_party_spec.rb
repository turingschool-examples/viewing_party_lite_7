require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_numericality_of(:duration).only_integer }
  end
end