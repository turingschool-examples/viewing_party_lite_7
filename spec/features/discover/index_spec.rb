# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover' do
  before :each do
    @user1 = User.create!(name: 'User 1', email: 'user1@email.com')
    @viewing_party = ViewingParty.create!(duration: 120, date: '2021-01-01', time: '12:00:00', movie_id: 1)

    ViewingPartyUser.create!(user_id: @user1.id, viewing_party_id: @viewing_party.id, host: true)
  end

  describe 'As a user when I visit my dashboard and click the discover movies button' do
    it 'I am taken to the discover page' do
      VCR.use_cassette(:user_show, serialize_with: :json) do
        visit user_path(@user1)
      end
      
      click_button('Discover Movies')
      expect(current_path).to eq(user_discover_path(@user1))
    end
  end

  describe 'As an user, when I visit the discover movie page (where :id is the id of a valid user)' do
    it 'I see a button to discover top rated movies' do
      VCR.use_cassette(:top_movies, serialize_with: :json) do
        visit user_discover_path(@user1)

        click_button('Top Rated Movies')
      end
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end

    it 'I see a text field to enter keyword(s) to search by movie title' do
      VCR.use_cassette(:movies_search, serialize_with: :json) do
        visit user_discover_path(@user1)

        fill_in :keyword, with: 'The Godfather'
        click_button 'Search'
      end
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end