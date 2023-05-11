# frozen_string_literal: true

require 'rails_helper'

describe 'user discover page' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    @viewing_party1 = @user1.viewing_parties.create!(duration: 120, date: '12/12/2023',
                                                     time: '2023-12-12 13:00:00 UTC', movie_id: 1)
    @viewing_party2 = @user1.viewing_parties.create!(duration: 120, date: '13/12/2023',
                                                     time: '2023-13-12 13:00:00 UTC', movie_id: 2)
    @viewing_party3 = @user2.viewing_parties.create!(duration: 120, date: '06/01/2023',
                                                     time: '2023-01-06 13:00:00 UTC', movie_id: 3)

    visit user_discover_path(@user1)
  end

  it 'has Top Rated Movies button', :vcr do
    expect(page).to have_button('Top Rated Movies')
    click_button('Top Rated Movies')
    expect(current_path).to eq(user_movies_path(@user1))
  end

  it 'has search feature to search movies by title' do
    expect(page).to have_content('Search movies by title')
  end

  it 'has button to submit search by title' do
    expect(page).to have_button('Search')
  end

  it 'redirects to results page', :vcr do
    fill_in 'title', with: 'gods'
    click_button('Search')
    expect(current_path).to eq(user_movies_path(@user1))
    expect(page).to have_content('God', count: 20)
  end
end