require "rails_helper" 

RSpec.describe "Movie Results Page" do 
  before(:each) do 
    @user1 = User.create!(name: "Wolfie", email: "wolfie@gmail.com")
  end
  describe "search results" do 
    it "displays search results for a keyword/title search" do 
      visit "/users/#{@user1.id}/discover"
      fill_in "keyword", with: "Jaws"
      click_button "Search"

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      
      # stub this below
      # within("#results") do 
      #   expect(page).to have_content()
      # end
    end
    
    it "has a button to return to the discover page" do 
      visit "/users/#{@user1.id}/movies"
      click_button "Discover Movies" 
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end
end

curl --request GET \
     --url 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc' \
     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2VjOWMzOGI0YzQ2OWE1OGExZDBiMzgzMjBmNGVjOSIsInN1YiI6IjY0YTYxYzI1MDdmYWEyMDBlNDBiNTFkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qqbkVYkBsvGZgSIHWwzsMaIF8W9d9zoGGt6CRlE9WM4' \
     --header 'accept: application/json'