require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many :party_guests }
    it { should have_many(:users).through(:party_guests) }
  end
end