# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the /users/:id page', type: :feature do
  describe 'When a user is valid, and visits their dashboard', :vcr do
    it 'they should see their name, a button to discover movies, and a list of their viewing parties' do
      user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
      user2 = User.create!(name: 'Jane Doe', email: 'jdoe@aol.com')
      viewing_party1 = ViewingParty.create!(movie_id: 1, movie_title: 'Jaws',
                                            movie_image: '/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg', duration: 120, date: '12/10/2023', start_time: '12:30:00')
      viewing_party2 = ViewingParty.create!(movie_id: 2, movie_title: 'The Shining',
                                            movie_image: '/kdPMUMJzyYAc4roD52qavX0nLIC.jpg', duration: 90, date: '13/10/2023', start_time: '17:15:00')
      UsersViewingParty.create!(user_id: user.id, viewing_party_id: viewing_party1.id)
      UsersViewingParty.create!(user_id: user.id, viewing_party_id: viewing_party2.id, hosting?: true)
      UsersViewingParty.create!(user_id: user2.id, viewing_party_id: viewing_party1.id, hosting?: true)
      UsersViewingParty.create!(user_id: user2.id, viewing_party_id: viewing_party2.id)

      visit user_path(user)

      expect(page).to have_content("John Smith's Dashboard")
      expect(page).to have_button('Discover Movies')

      within('#viewing_parties') do
        expect(page).to have_content(viewing_party1.movie_title)
        expect(page).to have_content(viewing_party2.movie_title)
      end
    end
  end
end
