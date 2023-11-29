require 'rails_helper' 

describe 'Movie Details Page' do
  describe "functionality" do
    before :each do
      test_data

      popular_movies_fixture = File.read("spec/fixtures/popular_movies.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV["API_KEY"]}").
      with(
        headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.12'
        }).
      to_return(status: 200, body: popular_movies_fixture, headers: {})
      
      visit user_discover_index_path(@user1)
      click_button "Search by Movie Title"
      click_link "The Creator"

      @creator_movie = Movie.all.find{|m| m.title == "The Creator"}
    end

    xit 'has a button to create a new viewing party' do
      expect(page).to have_button("Create Viewing Party for The Creator")
    end

    xit 'has a button to return to the Discover Page' do
      expect(page).to have_button("Discover Page")
    end
  end

  describe 'details' do
    before :each do
      test_data
      oppenheimer_movie_fixture = File.read("spec/fixtures/oppenheimer_movie_details.json")
      oppenheimer_cast_fixture = File.read("spec/fixtures/oppenheimer_movie_cast.json")
      oppenheimer_reviews_fixture = File.read("spec/fixtures/oppenheimer_movie_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/872585?api_key=#{ENV["API_KEY"]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: oppenheimer_movie_fixture, headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/872585/reviews?api_key=#{ENV["API_KEY"]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: oppenheimer_cast_fixture, headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/872585/credits?api_key=#{ENV["API_KEY"]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: oppenheimer_reviews_fixture, headers: {})

      visit "/users/#{@user1.id}/movies/872585"
    end

    xit "has all of the required details listed about the movie" do
      expect(page).to have_content("Oppenheimer")
      expect(page).to have_content("Vote: 8.153")
      expect(page).to have_content("Runtime: 3h 1min")
      expect(page).to have_content("Genres: Drama and History")
      expect(page).to have_content("Summary: The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.")
    end  
      
    xit "has 10 of the cast members with actors and character listed" do
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

  xit "has reviews" do
    expect(page).to have_content("Reviews")
    expect(page).to have_content("Manuel São Bento")
    expect(page).to have_content("Oppenheimer is a true masterclass in how to build extreme",)
  end
end