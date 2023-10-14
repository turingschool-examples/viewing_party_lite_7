require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :party_guests }
    it { should have_many(:viewing_parties).through(:party_guests) }
  end
end