require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it {should have_many(:user_parties)}
    it {should have_many(:users).through(:user_parties)}
  end

  describe 'instance methods' do
    before(:each) do
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)

      @party1 = create(:party, movie_id: 2)
      @party2 = create(:party, movie_id: 3)

      @user_party1 = UserParty.create!(user: @user1, party: @party2)
      @user_party2 = UserParty.create!(user: @user3, party: @party1)
      @user_party3 = UserParty.create!(user: @user2, party: @party1)
      @user_party4 = UserParty.create!(user: @user1, party: @party1, is_host: true)
      @user_party5 = UserParty.create!(user: @user2, party: @party2, is_host: true)
    end

    describe '#host_name' do
      it 'returns the name of the host of a specific party' do
        expect(@party1.host_name).to eq(@user1.name)
        expect(@party2.host_name).to eq(@user2.name)
      end
    end
  end
end