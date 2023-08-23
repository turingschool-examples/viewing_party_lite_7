require 'rails_helper'

RSpec.describe "users movies show page" do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")
    @movie = Movie.create!(
      title: "Batman", 
      vote_average: 8, 
      runtime: nil, 
      genre_ids: [12], 
      overview: "A man and a bat", 
      top_10: nil, 
      vote_count: 122, 
      review_authors: nil)

    visit user_movie_path(@user_1, @movie)
  end

  describe "as a user" do
    describe "when I visit a movie's detail page (/users/:user_id/movies/:movie_id) - where user_id is valid" do
      it "I should see a button to create a viewing party and a button to return to the Discover Page" do
        expect(page).to have_button("Create Viewing Party")
        expect(page).to have_button("Discover Page")
      end

      it "when I click the viewing party button it should take me to the new viewing party page and I should see all the movie details" do
        movie_details = (
          title: "Batman", 
          vote_average: 8, 
          runtime: nil, 
          genre_ids: [12], 
          overview: "A man and a bat", 
          top_10: nil, 
          vote_count: 122, 
          review_authors: nil)
        
        click_on "Create Viewing Party" 
        expect(page).to have_current_path(new_viewing_party)
        expect(page).to have_content(movie_details)
      end
    end
  end
end