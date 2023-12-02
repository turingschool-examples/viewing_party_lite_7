require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scott DeVoss', email: 'scottd@gmail.com')
    @user2 = User.create!(name: 'Cory Powell', email: 'coryp@yahoo.com')
  end

  describe "When I visit '/users/:user_id/movies/:movie_id'" do
    it "shows a button to Create a Viewing Party and a buttong to return to
    the Discover Page" do
      VCR.use_cassette('batman_details') do
        visit "/users/#{@user1.id}/movies/155"

        expect(page).to have_button('Create a Viewing Party')

        click_button('Create a Viewing Party')

        expect(current_path).to eq("/users/#{@user1.id}/movies/155/viewing-party/new")

        visit "/users/#{@user1.id}/movies/155"
        expect(page).to have_button('Discover Page')

        click_button('Discover Page')

        expect(current_path).to eq("/users/#{@user1.id}/discover")
      end
    end

    it "shows information about the movie: title, vote average, runtime, genre(s),
    summary" do
      VCR.use_cassette('batman_details') do
        visit "/users/#{@user1.id}/movies/155"

        expect(page).to have_content('The Dark Knight')
        expect(page).to have_content('8.513')
        expect(page).to have_content('Runtime: 2h 32min')
        expect(page).to have_content('Genre(s): Drama, Action, Crime, Thriller')
        expect(page).to have_content('Summary: Batman raises the stakes in his war on crime. ')
      end
    end

    it 'lists the first 10 cast members,  ' do
      VCR.use_cassette('batman_details') do
        visit "/users/#{@user1.id}/movies/155"

        expect(page).to have_content('Cast and Crew:')
        expect(page).to have_content('Christian Bale')
      end
    end

    it "total review count (and each review's author and info)" do
      VCR.use_cassette('batman_details') do
        visit "/users/#{@user1.id}/movies/155"

        expect(page).to have_content('Total Reviews: 13')
        expect(page).to have_content('Author: tricksy')
      end
    end
  end
end
