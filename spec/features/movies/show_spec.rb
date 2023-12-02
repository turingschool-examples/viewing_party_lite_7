require 'rails_helper' 

describe 'Movie Details Page' do
  before :each do
    test_data
    oppenheimer_test_data
    missing_poster_test_data
    placeholder_poster_test_data
    visit user_movie_path(@user1, 872585)
  end

  describe "functionality" do
    it 'has a button to create a new viewing party' do
      expect(page).to have_button("Create Viewing Party for Oppenheimer")
    end
  
    it 'has a button to return to the Discover Page' do
      expect(page).to have_button("Discover Page")
    end

    it "'Create Viewing Party' button should take the user to the new viewing party page" do
      click_button "Create Viewing Party for Oppenheimer"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 872585))
    end
  end

  describe 'details' do

    it "has all of the required details listed about the movie" do
      expect(page).to have_content("Oppenheimer")
      expect(page).to have_content("Vote: 8.153")
      expect(page).to have_content("Runtime: 3h 1min")
      expect(page).to have_content("Genres: Drama and History")
      expect(page).to have_content("Summary: The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.")
    end  
      
    it "has 10 of the cast members with actors and character listed" do
      expect(page).to have_content("Cast")
      expect(page).to have_content("Cillian Murphy as J. Robert Oppenheimer")
      expect(page).to have_content("Emily Blunt as Kitty Oppenheimer")
      expect(page).to have_content("Matt Damon as Leslie Groves")
      expect(page).to have_content("Robert Downey Jr. as Lewis Strauss")
      expect(page).to have_content("Florence Pugh as Jean Tatlock")
      expect(page).to have_content("Josh Hartnett as Ernest Lawrence")
      expect(page).to have_content("Casey Affleck as Boris Pash")
      expect(page).to have_content("Rami Malek as David Hill")
      expect(page).to have_content("Kenneth Branagh as Niels Bohr")
      expect(page).to have_content("Benny Safdie as Edward Teller")
    end
  end

  it "has reviews that returns the author and information" do
    expect(page).to have_content("Reviews")
    expect(page).to have_content("Manuel São Bento")
    expect(page).to have_content("Oppenheimer is a true masterclass in how to build extreme",)
    expect(page).to have_content("msbreviews")
    expect(page).to have_content("8.0 stars")
  end

  it "lists how many reviews are for this movie" do
    reviews = MovieReviewsFacade.new(872585).movie_reviews
    expect(page).to have_content("#{reviews.count} Reviews")
  end

  describe "sad path" do
    it "will still load page if no poster is available" do
      visit user_movie_path(@user1, 1209375)
      expect(page).to have_content("The Creator")
      expect(page).to have_content("Vote: 0.0")
      expect(page).to have_content("Summary: Amid a future war")
    end
  end
end