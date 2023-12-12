require 'rails_helper'

describe 'the User Discover Dashboard page' do
  before(:each) do
    @user = User.create!(name: 'Joseph Lee', email: 'jlee230@turing.edu', password: "test")
  end

  it 'has a link to the landing page' do
    visit '/'

    expect(page).to have_link('Viewing Party Landing Page')
    click_link('Viewing Party Landing Page')
    expect(current_path).to eq(root_path)
  end

  it "tests the 'Find Top Rated Movies' function", :vcr do
    VCR.use_cassette('top_rated_movies') do
      visit user_discover_path(@user.id)

      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_field(:search)
      expect(page).to have_button('Find Movies')

      click_on 'Find Top Rated Movies'

      expect(current_path).to eq("/users/#{@user.id}/movies")
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('8.7')
      expect(page).to have_content('The Shawshank Redemption')
      expect(page).to have_content('8.7')
      expect(page).to have_content('The Godfather Part II')
      expect(page).to have_content('8.5')
      expect(page).to have_button('Discover')
      click_on('Discover')
      expect(current_path).to eq(user_discover_path(@user.id))
    end
  end

  it "tests the 'search for a movie' function", :vcr do
    VCR.use_cassette('search_for_a_movie') do
      visit user_discover_path(@user.id)

      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_field(:search)
      expect(page).to have_button('Find Movies')

      fill_in :search, with: 'Die Hard'

      click_on('Find Movies')

      expect(current_path).to eq("/users/#{@user.id}/movies")
      expect(page).to have_content('Die Hard')
      expect(page).to have_content('7.')
      expect(page).to have_content('A Good Day to Die Hard')
      expect(page).to have_content('5.')
      expect(page).to have_content('Die Hard 2')
      expect(page).to have_content('6.')

      expect(page).to have_button('Discover')
      click_on('Discover')
      expect(current_path).to eq(user_discover_path(@user.id))
    end
  end
end
