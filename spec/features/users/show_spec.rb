require 'rails_helper'

RSpec.describe 'User SHow Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the User Show Page.' do

    visit user_path(@user1.id)
    
    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_content(@user1.email)

    expect(page).to have_content("Hosted By: Jerry")
    # expect(page).to have_content(@party1.movie_title)
    
    expect(page).to have_content("Hosted By: Tom")
    # expect(page).to have_content(@party2.movie_title)
    # save_and_open_page
  end

  it 'When I go to a user dashbaord, and click "Discover Movies" button, I am redirected to a discover page /users/:id/discover' do

    visit user_path(@user1.id)
    
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(user_id: @user1.id))
    # save_and_open_page
  end
end