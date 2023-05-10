require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    @party1 = create(:party, host_id: @user1.id, movie_id: 2)
    @party2 = create(:party, host_id: @user2.id, movie_id: 3)

    @user_party1 = UserParty.create!(user: @user1, party: @party2)
    @user_party2 = UserParty.create!(user: @user3, party: @party1)
    @user_party2 = UserParty.create!(user: @user2, party: @party1)
  end

  describe 'relationships' do
    it {should have_many(:user_parties)}
    it {should have_many(:parties).through(:user_parties)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
  end

  describe 'instance methods' do
    describe '#hosted_parties' do
      it 'returns an array of all parties the user is hosting' do
        expect(@user1.hosted_parties).to eq([@party1])
      end
    end
  end
end