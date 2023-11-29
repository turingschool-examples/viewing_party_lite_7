require 'rails_helper'

RSpec.describe 'user can filter top 20 rated movies', type: :feature do
  before(:each) do
    @user = create(:user)
  end

  it 'Allows user to see top 20 rated movies', :vcr do
    visit user_discover_index_path(@user)

    click_button 'Top Rated Movies'

    expect(page.status_code).to eq(200)

    expect(current_path).to eq(user_movies_path(@user))
    expect(page).to have_content('The Godfather')
  end
end
