require 'rails_helper'

RSpec.describe 'user story 10' do
  describe 'movie details page' do
    before(:each) do
      @user1 = User.create(name: 'Bob', email: 'bob@email.com')
      @user2 = User.create(name: 'Sally', email: 'sally@email.com')
    end 

    it 'displays a button to create a viewing party', :vcr do
      # visit user_movie_path(@user1, 324857)
      visit "/users/#{@user1.id}/movie/324857"

      within '#create-party' do
        expect(page).to have_button('Create Viewing Party for Movie')
        click_button 'Create Viewing Party for Movie'
      end

      # expect(current_path).to eq("/users/#{@user1.id}/movie/324857/viewing_parties/new")
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 324_857))
    end



    it 'displays a button to return to the discover page', :vcr do
      visit "/users/#{@user1.id}/movie/324857"

      within '#discover-button' do
        expect(page).to have_button('Back to Discover')
        click_button 'Back to Discover'
      end

      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end
end