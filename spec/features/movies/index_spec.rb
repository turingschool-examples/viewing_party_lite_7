require 'rails_helper'

describe 'the User Discover Dashboard page' do
  before(:each) do
    @user = User.create!(name: 'Joseph Lee', email: 'jlee230@turing.edu')
  end

  it "tests the 'Find Top Rated Movies' function" do
    visit user_discover_path(@user.id)

    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_field(:search)
    expect(page).to have_button('Find Movies')

    click_on 'Find Top Rated Movies'

    expect(current_path).to eq("/users/#{@user.id}/movies")
    expect(page).to have_content('The Godfather')
    expect(page).to have_content('8.7')
    expect(page).to have_content('The Shawshank Redemption')
    expect(page).to have_content('8.705')
    expect(page).to have_content('The Godfather Part II')
    expect(page).to have_content('8.6')

    expect(page).to have_button('Discover')
    click_on('Discover')
    expect(current_path).to eq(user_discover_path(@user.id))
  end

  it "tests the 'search for a movie' function" do
    visit user_discover_path(@user.id)

    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_field(:search)
    expect(page).to have_button('Find Movies')

    fill_in :search, with: 'Die Hard'

    click_on('Find Movies')

    expect(current_path).to eq("/users/#{@user.id}/movies")
    expect(page).to have_content('Die Hard')
    expect(page).to have_content('7.78')
    expect(page).to have_content('A Good Day to Die Hard')
    expect(page).to have_content('5.32')
    expect(page).to have_content('Die Hard 2')
    expect(page).to have_content('6.929')

    expect(page).to have_button('Discover')
    click_on('Discover')
    expect(current_path).to eq(user_discover_path(@user.id))
  end
end
