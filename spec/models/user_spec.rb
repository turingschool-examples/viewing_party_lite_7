require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:partygoers) }
    it { should have_many(:parties).through(:partygoers) }
  end
end
