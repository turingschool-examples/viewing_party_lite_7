# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    @user1 = User.create!(name: 'User 1', email: 'user1@email.com')
    @user2 = User.create!(name: 'User 2', email: 'user2@email.com')

    @viewing_party = ViewingParty.create!(duration: 120, date: '2021-01-01', time: '12:00:00', movie_id: 550, movie_title: 'Fight Club', movie_poster: '/a26cQPRhJPX6GbWfQbvZdrrp9j9.jpeg')
    @viewing_party2 = ViewingParty.create!(duration: 230, date: '2021-02-01', time: '13:00:00', movie_id: 238, movie_title: 'The God Father', movie_poster: '/3bhkrj58Vtu7enYsRolD1fZdja1.jpeg')

    ViewingPartyUser.create!(user_id: @user1.id, viewing_party_id: @viewing_party.id, host: true)
    ViewingPartyUser.create!(user_id: @user2.id, viewing_party_id: @viewing_party.id)

    ViewingPartyUser.create!(user_id: @user1.id, viewing_party_id: @viewing_party2.id)
    ViewingPartyUser.create!(user_id: @user2.id, viewing_party_id: @viewing_party2.id, host: true)

    VCR.use_cassette(:user_dashboard, serialize_with: :json) do
      visit user_path(@user1)
    end
  end

  describe 'As a user when I visit my dashboard' do
    it 'I see my name at the top of the page' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it 'I see a button to discover movies' do
      expect(page).to have_button('Discover Movies')
    end

    it 'I see a section for viewing parties' do
      expect(page).to have_content('Viewing Parties')
    end

    it 'I should see the viewing parties that the user has been invited to with the party details' do 
      within("##{@viewing_party.id}-party-details") do
        expect(page).to have_css("img[src='https://image.tmdb.org/t/p/w500/a26cQPRhJPX6GbWfQbvZdrrp9j9.jpeg']")
        expect(page).to have_link("#{@viewing_party.movie_title}")
        expect(page).to have_content("Date: #{@viewing_party.date}")
        expect(page).to have_content("Time: #{@viewing_party.time}")
        expect(page).to have_content("Hosted by: #{@viewing_party.host}")
        expect(page).to have_content("Invited:\n#{@user2.name}")
      end
    end
    
    it 'I should see the viewing parties that the user is hosting with the party details' do
      within("##{@viewing_party2.id}-party-details") do
        expect(page).to have_css("img[src='https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpeg']")
        expect(page).to have_link("#{@viewing_party2.movie_title}")
        expect(page).to have_content("Date: #{@viewing_party2.date}")
        expect(page).to have_content("Time: #{@viewing_party2.time}")
        expect(page).to have_content("Hosted by: #{@viewing_party2.host}")
        expect(page).to have_content("Invited:\n#{@user1.name}")
      end
    end
  end
end
