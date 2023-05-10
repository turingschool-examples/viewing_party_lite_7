require 'rails_helper'

describe 'Movies discover page' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
  end

  describe "Page Display" do
    it 'has application title' do
      visit "/users/#{@user1.id}/discover"
      expect(page).to have_content('Viewing Party')

      visit "/users/#{@user2.id}/discover"
      expect(page).to have_content('Viewing Party')
    end
    
    it 'has discover movies title' do
      visit "/users/#{@user1.id}/discover"
      expect(page).to have_content('Discover Movies')

      visit "/users/#{@user2.id}/discover"
      expect(page).to have_content('Discover Movies')
    end

    it 'has button to discover top rates movies' do
      visit "/users/#{@user1.id}/discover"
      expect(page).to have_button('Find Top Rated Movies')

      visit "/users/#{@user2.id}/discover"
      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'has a text field to enter keywords that search by movie title and button' do
      visit "/users/#{@user1.id}/discover"

      within '#search_button' do
        expect(page).to have_css('input[type="text"]')
        expect(page).to have_button('Find Movies')
        expect(page).to have_content("Input the name of a movie you want to find!")
      end

      visit "/users/#{@user2.id}/discover"

      within '#search_button' do
        expect(page).to have_css('input[type=text]')
        expect(page).to have_button('Find Movies')
        expect(page).to have_content("Input the name of a movie you want to find!")
      end
    end
  end

  describe "Button Functionallity" do
    describe "Find Top Rated Movies Button" do
      it "redirects to movies result page" do
        visit "/users/#{@user1.id}/discover"

        click_button("Find Top Rated Movies")
        expect(current_path).to eq("/users/#{@user1.id}/movies")

        visit "/users/#{@user2.id}/discover"

        click_button("Find Top Rated Movies")
        expect(current_path).to eq("/users/#{@user2.id}/movies")
      end
    end

    describe "Find Movies Button" do
      it "redirects to movies result page" do
        visit "/users/#{@user1.id}/discover"

        fill_in :movie, with: "Interstellar"
        click_button("Find Movies")
        expect(current_path).to eq("/users/#{@user1.id}/movies")

        visit "/users/#{@user2.id}/discover"

        fill_in :movie, with: "Pulp Fiction"
        click_button("Find Movies")
        expect(current_path).to eq("/users/#{@user2.id}/movies")
      end

      it "provides flash error and redirects to same page if input is less than 1 charater" do
        visit "/users/#{@user1.id}/discover"

        fill_in :movie, with: ""
        click_button("Find Movies")
        expect(current_path).to eq("/users/#{@user1.id}/discover")
        expect(page).to have_content('Error: Input must be at least 1 charachter')
      end
    end
  end
end
