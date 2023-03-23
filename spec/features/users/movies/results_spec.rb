require 'rails_helper'

describe "When I visit the discover movies page, and click on either the Top Movies button or the Search button," do
  describe "I should be taken to the movie results page where I see:" do
    describe "user clicked top movies button" do
      before :each do
        @user = create(:user)
        visit user_movies_discover_path(@user)
        VCR.use_cassette("top_rated_movies") do
          click_button "Discover Top Rated Movies"
        end
      end

      it 'Title of each movie' do
        expect(page).to have_content('The Godfather')
        expect(page).to have_content('The Shawshank Redemption')
        expect(page).to have_content('Cuando Sea Joven')
        expect(page).to have_content('The Godfather Part II')
        expect(page).to have_content("Schindler's List")
        expect(page).to have_content('Dilwale Dulhania Le Jayenge')
        expect(page).to have_content('Spirited Away')
        expect(page).to have_content('12 Angry Men')
        expect(page).to have_content('Your Name.')
        expect(page).to have_content('Parasite')
        expect(page).to have_content('The Dark Knight')
        expect(page).to have_content('The Boy, the Mole, the Fox and the Horse')
        expect(page).to have_content('The Green Mile')
        expect(page).to have_content('Pulp Fiction')
        expect(page).to have_content("Dou kyu sei")
        expect(page).to have_content('The Good, the Bad and the Ugly')
        expect(page).to have_content('Forrest Gump')
        expect(page).to have_content('The Lord of the Rings: The Return of the King')
        expect(page).to have_content('Primal: Tales of Savagery')
        expect(page).to have_content("GoodFellas")
      end

      it 'vote average of each movie' do
        expect(page).to have_content('Vote Average', count: 20)

        within "#movie-238" do
          expect(page).to have_content('Vote Average: 8.7')
        end
      end

      it 'there should only be a max of 20 results' do
        expect(page).to have_content("Showing 20 Results")
        expect(page).to have_content("Result #", count: 20)
      end

      it 'there should also be a button to return to the discover page' do
        expect(page).to have_button("Return to Discover Page")
      end
    end

    describe "user searches by keyword" do
      before :each do
        @user = create(:user)
        visit user_movies_discover_path(@user)
        within "#search" do
          fill_in "movie_title", with: "Despicable"
        end
          VCR.use_cassette("search_results") do
            within "#search" do
              click_button "Search by Movie Title"
            end
          end
      end

      it 'Title of each movie' do
        expect(page).to have_content('Despicable Me')
        expect(page).to have_content('Despicable Me 2')
        expect(page).to have_content('Despicable Me 3')
        expect(page).to have_content('Despicable Me 4')
      end

      it 'vote average of each movie' do
        expect(page).to have_content('Vote Average', count: 18)

        within "#movie-20352" do
          expect(page).to have_content('Vote Average: 7.223')
        end
      end

      it 'there should only be a max of 20 results' do
        visit user_movies_discover_path(@user)
        fill_in "movie_title", with: "Love"
        VCR.use_cassette("search_results_2") do
          click_button "Search by Movie Title"
        end
        expect(page).to have_content("Showing 20 Results")
      end

      it 'there should also be a button to return to the discover page' do
        expect(page).to have_button("Return to Discover Page")
      end
    end
  end
end