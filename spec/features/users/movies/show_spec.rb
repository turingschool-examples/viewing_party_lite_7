require 'rails_helper'

RSpec.describe 'Movie Results' do
  before(:each) do
    load_test_data
  end
  it 'When I go to a user dashbaord, and click "Discover Movies" button, I am redirected to a discover page /users/:id/discover' do

    visit "/users/#{@user1.id}/movies/268"
    click_link "Go to Landing Page"
    expect(current_path).to eq("/")

    visit "/users/#{@user1.id}/movies/268"
    click_button "Create a Viewing Party"
    expect(current_path).to eq("/users/#{@user1.id}/movies/268/viewing-party/new")

    visit "/users/#{@user1.id}/movies/268"
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(user_id: @user1.id))

    visit "/users/#{@user1.id}/movies/268"
    # save_and_open_page

    expect(page).to have_content("Movie Id: 268")
    expect(page).to have_content("Vote Average: 7.2")
    expect(page).to have_content("Runtime: 2 hours 6 minutes") 

  end
end

