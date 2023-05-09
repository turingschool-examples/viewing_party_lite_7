require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many(:partygoers) }
    it { should have_many(:users).through(:partygoers) }
  end
end
