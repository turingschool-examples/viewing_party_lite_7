require 'rails_helper'

RSpec.describe '/users/:id', type: :feature do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    @party1 = create(:party, host_id: @user1.id, movie_id: 2, start_time: "04:30:45 UTC")
    @party2 = create(:party, host_id: @user2.id, movie_id: 3, start_time: "04:35:30 UTC")

    @user_party1 = UserParty.create!(user: @user1, party: @party2)
    @user_party2 = UserParty.create!(user: @user3, party: @party1)
    @user_party2 = UserParty.create!(user: @user2, party: @party1)
    visit user_path(@user1)
  end

  describe 'When I visit the users dashboard page' do
    it 'I see <users name> Dashboard" at the top of the page' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it 'has a button (Discover Movies)' do
      expect(page).to have_button('Discover Movies')
    end

    it 'has a section that list viewing parties' do
      expect(page).to have_content('Parties Hosting')
      expect(page).to have_content('Parties Attending')

      within "#hosting" do
        expect(page).to have_content(@party1.date)
        expect(page).to have_content(@party1.start_time)
        expect(page).to have_content("Host: #{@user1.name}")
        expect(page).to have_content('Invited:')
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user3.name)
      end

      within "#invited" do
        expect(page).to have_content(@party2.date)
        expect(page).to have_content(@party2.start_time)
        expect(page).to have_content("Host: #{@user2.name}")
        expect(page).to have_content('Invited:')
        expect(page).to have_content(@user1.name)
      end
    end
  end

  describe 'When I visit the users dashboard page and click "Discover Movies"' do
    it 'redirects to a discover page for the specific user' do
      click_button 'Discover Movies'

      expect(current_path).to eq(user_discover_path(@user1))
      expect(page).to have_content('Discover Movies')
    end
  end
end
