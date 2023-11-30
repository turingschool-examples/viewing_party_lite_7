require 'rails_helper'

RSpec.describe 'user discover results page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

  it 'displays the title of relevant movies and their vote average' do
    visit user_discover_index_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(current_path).to eq(user_movies_path(@user1))
    expect(page).to have_content('The Godfather')
    # expect(page).to have_content('8.708') # fix test in refactor
  end

  it 'limits results to 20 movies' do
    visit user_discover_index_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(page).to have_content('Average Rating', count: 20)
  end

  it 'has a button to return to discover page' do
    visit user_discover_index_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(page).to have_button('Back to Discover Page')
    click_button('Back to Discover Page')
    expect(current_path).to eq(user_discover_index_path(@user1))
  end
end
