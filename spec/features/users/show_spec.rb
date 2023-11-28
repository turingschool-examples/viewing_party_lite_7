require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'when a user visits the users dashboard' do
    before(:each) do
      @user = create(:user)
    end
    
    it 'displays the users name and Dashboard on the top of the page' do
      visit user_path(@user)

      expect(page).to have_content("#{@user.name}'s Dashboard")
    end

    it 'displays a button to discover movies which redirects the user to the users discover page' do
      visit user_path(@user.id)

      expect(page).to have_button("Discover Movies")

      click_on("Discover Movies")

      expect(current_path).to eq(user_discover_index_path(@user))
    end

    it 'displays a section which contains a list of viewing parties' do
      party_1 = create(:party)
      party_2 = create(:party)
      party_3 = create(:party)

      UserParty.create(user: @user, party: party_1, host: true)
      UserParty.create(user: @user, party: party_2, host: true)
      UserParty.create(user: @user, party: party_3, host: true)

      visit user_path(@user.id)

      expect(page).to have_content(party_1.movie_id)
      expect(page).to have_content(party_2.movie_id)
      expect(page).to have_content(party_3.movie_id)
    end
  end
end

