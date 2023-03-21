require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    @user1 = User.create!(name: 'User 1', email: 'user1@email.com')
    @user2 = User.create!(name: 'User 2', email: 'user2@email.com')
    @viewing_party = ViewingParty.create!(duration: 120, date: '2021-01-01', time: '12:00:00', movie_id: 1)

    ViewingPartyUser.create!(user_id: @user1.id, viewing_party_id: @viewing_party.id, host: true)

    visit user_path(@user1)
  end

  describe 'As a user when I visit my dashboard' do
    it 'I see my name at the top of the page' do

      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content(@user2.name)
    end

    it 'I see a button to discover movies' do
      expect(page).to have_button('Discover Movies')
    end

    it 'I see a section for viewing parties' do
      expect(page).to have_content("Viewing Parties")
      expect(page).to have_content("Duration: #{@viewing_party.duration}")
      expect(page).to have_content("Date: #{@viewing_party.date}")
      expect(page).to have_content("Time: #{@viewing_party.time}")
      expect(page).to have_content("Movie: #{@viewing_party.movie_id}")
    end
  end
end