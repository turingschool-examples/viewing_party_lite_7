# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before(:each) do
    @user = User.create!(name: 'Bob', email: 'bob@bob.bob')
    @user2 = User.create!(name: 'Bobby', email: 'bobby@rob.bob')
    @user3 = User.create!(name: 'Robbie', email: 'Robby@bobby.bob')

    VCR.use_cassette(:movie_details, serialize_with: :json) do
      visit "/users/#{@user.id}/movies/238/viewing-party/new"
    end
  end

  context 'When I visit the new viewing party page' do
    it 'I should see the movie title rendered, along with a form to fill out viewing party attributes' do
      expect(page).to have_content('The Godfather')

      fill_in 'Duration of Party', with: 240
      fill_in 'When', with: Date.tomorrow
      fill_in 'Start Time', with: '18:00'
      
      check @user3.name

      click_on 'Create Party'
      expect(current_path).to eq("/users/#{@user.id}")
      expect(ViewingPartyUser.last).to eq(ViewingPartyUser.find_by(user_id: @user3.id, viewing_party_id: ViewingParty.last.id))
      expect(ViewingPartyUser.find_by(user_id: @user2.id, viewing_party_id: ViewingParty.last.id)).to eq(nil)
    end
  end
end
