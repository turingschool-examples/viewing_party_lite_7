require 'rails_helper'

RSpec.describe 'user discover page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

  it 'has a button to discover top rated movies' do
    visit user_discover_path(@user1)
    expect(page).to have_button('Discover Top Rated Movies')
  end

  context 'discover top rated movies button is clicked' do
    it 'redirects to movie results page, listing top rated movies' do
      visit user_discover_path(@user1)
      click_button('Discover Top Rated Movies')
      expect(current_path).to eq(user_discover_results_path(@user1))
      expect(page).to have_content('The Godfather')
    end
  end

  it 'has a form to search by movie title' do
    visit user_discover_path(@user1)
    within('#search') do
      expect(page).to have_field(:title)
      expect(page).to have_button('Search by Movie Title')
    end
  end

  context 'search by title form is filled out and submitted' do
    it 'redirects to movie results page with relevant movies' do
      visit user_discover_path(@user1)
      fill_in :title, with: 'Nightmare Before Christmas'
      click_button('Search by Movie Title')
      expect(current_path).to eq(user_discover_results_path(@user1))
      expect(page).to have_content('Nightmare Before Christmas')
    end
  end
end
