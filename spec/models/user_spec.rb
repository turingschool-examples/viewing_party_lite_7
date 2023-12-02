require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  before(:each) do
    @user1 = User.create!(name: 'Timmy Turner', email: 'timmyturner1@gmail.com')
    @user2 = User.create!(name: 'Wanda', email: 'ilovecosmo1@gmail.com')
    @user3 = User.create!(name: 'Cosmo', email: 'ilovewanda1@gmail.com')
  end
end
