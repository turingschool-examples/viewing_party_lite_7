require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:name) }
  end

  describe 'instance methods' do
    it '#other_users' do
      @user_1 = User.create!(name: "Bob", email: "bobert@bob.com")
      @user_2 = User.create!(name: "Jeff", email: "jefferey@bob.com")
      @user_3 = User.create!(name: "Sally", email: "sally@bob.com")
      
      expect(@user_1.other_users).to eq([@user_2, @user_3])
    end
  end
end