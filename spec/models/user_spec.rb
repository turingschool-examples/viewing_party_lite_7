require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'relationships' do
    it { should have_many :party_guests }
    it { should have_many(:viewing_parties).through(:party_guests) }
  end
end
