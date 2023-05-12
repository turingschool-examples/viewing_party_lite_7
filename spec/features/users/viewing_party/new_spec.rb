require 'rails_helper'

RSpec.describe 'continue user story 10' do
  describe 'new viewing party page details' do
    before(:each) do
      @user1 = User.create(name: 'Bob', email: 'bob@email.com')
      @user2 = User.create(name: 'Sally', email: 'sally@email.com')
    end

    it 'displays movie title and vote average', :vcr do
      visit new_user_movie_viewing_party_path(@user1, 324_857)

      expect(page).to have_content('Spider-Man: Into the Spider-Verse')
      expect(page).to have_content(8.4)
    end

    xit 'displays movie runtime in hours and minutes', :vcr do
      visit new_user_movie_viewing_party_path(@user1, 324_857)

      expect(page).to have_content
    end

    xit 'displays movie genre and summary description', :vcr do
      visit new_user_movie_viewing_party_path(@user1, 324_857)

      expect(page).to have_content
      expect(page).to have_content
    end
    xit 'displays first 10 cast members', :vcr do
      visit new_user_movie_viewing_party_path(@user1, 324_857)

      expect(page).to have_content
      expect(page).to have_content
    end

    xit 'displays count of total reviews', :vcr do
      visit new_user_movie_viewing_party_path(@user1, 324_857)

      expect(page).to have_content
    end

    xit 'displays each reviews author and information', :vcr do
      visit new_user_movie_viewing_party_path(@user1, 324_857)

      expect(page).to have_content
      expect(page).to have_content
      expect(page).to have_content
      expect(page).to have_content
    end
  end
end
