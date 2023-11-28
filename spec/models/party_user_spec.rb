require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end
  describe 'validations' do
    it { should validate_presence_of(:party) }
    it { should validate_presence_of(:user) }
  end
end