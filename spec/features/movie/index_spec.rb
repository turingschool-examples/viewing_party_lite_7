require 'rails_helper'

RSpec.describe "Movie Index" do
  before :each do
    @user = create(:user)
    visit movie_index_path(@user)
  end

  it 'visits page' do
    expect(current_path).to eq(movie_index_path(@user))
  end

  describe "discover user's movies" do 
    scenario "id is that of a valid user"
      it 'has button to search top rated movies' do
        expect(page).to have_button("Find Top Rated Movies")
        click_button("Find Top Rated Movies")
        expect(current_path).to eq("/users/#{@user.id}"/movies)
      end

      describe "search for a movie by title" do
        it "has a text field to enter keyword(s) to search by movie title" do
          expect(page).to have_field("keywords")
          expect(page).to have_content("Search by Movie Title")
        end
        
        it "has button to submit search by movie title" do
          expect(page).to have_button("Find Movies")
          expect(page).to_not have_content("Search by Show Title")
          expect(page).to_not have_content("Search by Movie ID")
        end
      end
    end
  end
end