require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    @user = User.create!(name: "Snoop Dogg", email: "Snoop@email.com")
    
    visit user_dashboard_path(@user)
  end

  it 'has the users name followed by dashboard' do
    expect(page).to have_content("Snoop Dogg's Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')

    click_button 'Discover Movies'

    expect(current_path).to eq(discover_movies_path(@user))
  end

  it 'has a viewing parties section' do
    expect(page).to have_content('Viewing Parties')

    # expect(page).to have_content('viewing party #1 more stuff here')
  end
end