require 'rails_helper'

RSpec.describe 'User Show Page' do
  before :each do
    @user_1 = create(id: 1, name: 'Jimmy', email: 'jimmy@email.com')
    @user_2 = create(id: 2, name: 'Billy', email: 'billy@email.com')
    visit "/user/1"
  end
  
  it 'displays the user name' do
    expect(page).to have_content("Jimmy")
    expect(page).to_not have_content("Billy")
  end

  it 'has button to Discover Movies, which redirects to the discover page' do
      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_index_path(@user1))
  end

  it 'I see a section that lists viewing parties' do
    within 'section#viewing_parties' do
      expect(page).to have_content('Viewing Parties')
    end
  end
end