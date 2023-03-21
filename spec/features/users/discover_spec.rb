require 'rails_helper'

RSpec.describe 'User Discover' do
  before :each do
    @user1 = User.create!(name: 'User 1', email: 'user1@email.com')
    @viewing_party = ViewingParty.create!(duration: 120, date: '2021-01-01', time: '12:00:00', movie_id: 1)

    ViewingPartyUser.create!(user_id: @user1.id, viewing_party_id: @viewing_party.id, host: true)

    visit dashboard_user_path(@user1)
  end

  describe 'As a user when I visit my dashboard and click the discover movies button' do
    it 'I am taken to the discover page' do
      click_button('Discover Movies')
      expect(current_path).to eq(discover_user_path(@user1))

    end
  end
end
