require 'rails_helper'

RSpec.describe 'movies detail page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

  it 'has a button to create a viewing party' do
    visit "/users/#{@user1.id}/movies/#{movie.id}"
    expect(page).to have_content("Create a Viewing Party")
    # click_button "Create a Viewing Party"
    # expect(current_path).to eq(viewing_party_path(@user1))
  end

  it 'has a button to return to the discover page' do 
    visit "/users/#{@user1.id}/movies/#{movie.id}"
    expect(page).to have_content("Back to Discover Page")
    click_button "Back to Discover Page"
    expect(current_path).to eq(user_discover_path(@user1))
  end

  it 'has movie attributes such as title, vote average, 
    runtime, genre, summary, cast members(first 10), total reviews
    and each reviews author and information' do
    visit "/users/#{@user1.id}/movies/#{movie.id}"
    expect(page).to have_content("Movie Title:")
    expect(page).to have_content("Vote Average:")
    expect(page).to have_content("Runtime:")
    expect(page).to have_content("Genre:")
    expect(page).to have_content("Summary:")
    expect(page).to have_content("Cast Members:")
    expect(page).to have_content("Total Reviews:")
    expect(page).to have_content("Review Author:")
    expect(page).to have_content("Review Details:")
  end
end
