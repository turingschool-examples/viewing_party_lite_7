require 'rails_helper'

RSpec.describe ApplicationHelper do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    @party1 = create(:party, host_id: @user1.id, movie_id: 2, start_time: "04:30:45 UTC")
    @party2 = create(:party, host_id: @user2.id, movie_id: 3)

    @user_party1 = UserParty.create!(user: @user1, party: @party2)
    @user_party2 = UserParty.create!(user: @user3, party: @party1)
    @user_party2 = UserParty.create!(user: @user2, party: @party1)
  end

  describe '#get_host_name' do
    it 'it returns the name of the host of a party' do
      expect(get_host_name(@party2.host_id)).to eq(@user2.name)
    end
  end
end