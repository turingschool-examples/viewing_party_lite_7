require 'rails_helper'

RSpec.describe 'New Viewing Party Page (/users/:user_id/movies/:movid_id/viewing-party/new)' do
  describe 'visiting the new viewing party page' do
    it 'displays a form to create a new viewing party', :vcr do
      kam = User.create!(name: "Kam", email: "doofus23@gmail.com")
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      visit "/users/#{kam.id}/movies/872585/viewing_parties/new"
      expect(page).to have_field(:duration)
      expect(page).to have_field(:when)
      expect(page).to have_field(:start_time)
      within '#potential_guests' do
        expect(page).to have_content("Invite #{user1.name}")
        expect(page).to have_content("Invite #{user2.name}")
        expect(page).to have_content("Invite #{user3.name}")
        expect(page).to have_content("Invite #{user4.name}")
      end
      expect(page).to have_button('Create Viewing Party')
    end
  end
  describe 'creating a new viewing party page', :ignore_request do
    it 'creates a new viewing party, and redirects back to the hosts dashboard', :vcr do
      kam = User.create!(name: "Kam", email: "doofus23@gmail.com")
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      visit "/users/#{kam.id}/movies/872585/viewing_parties/new"
      fill_in :duration, with: 184
      fill_in :when, with: "12/05/2023"
      fill_in :start_time, with: "6:15 PM"
      expect(page).to have_button('Create Viewing Party')
      check "Invite #{user1.name}", match: :first
      click_button 'Create Viewing Party'
      expect(current_path).to eq("/users/#{kam.id}")
    end
  end
end
