require 'rails_helper'

RSpec.describe 'user discover results page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

  it 'displays the title of relevant movies and their vote average' do
    visit user_discover_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(current_path).to eq(user_movies_path(@user1))
    expect(page).to have_content('The Godfather')
  end

  # need to figure out how to test this
  it 'limits results to 20 movies' do
    visit user_discover_path(@user1)
    click_button('Discover Top Rated Movies')

  end
end
