require 'rails_helper'

RSpec.describe ViewingParty, :vcr do
  describe 'validations' do
    it { should have_many(:users).through(:party_guests) }
    it { should have_many :party_guests }
  end
end
