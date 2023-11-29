require 'rails_helper'

RSpec.describe 'user can search for movie by movie title', type: :feature do
  before(:each) do
    @user = create(:user)
  end

  it 'Allows user to search by title' do
    visit user_discover_index_path(@user)

    fill_in :query, with: 'Star Wars'
    click_button 'Search'

    expect(page.status_code).to eq(200)

    expect(current_path).to eq(user_movies_path(@user))
    expect(page).to have_content('Star Wars')
  end
end