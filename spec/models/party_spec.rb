require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:users) }
  end
  describe 'validations' do
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:party_date) }
    it { should validate_presence_of(:duration_of_party) }
  end
end
