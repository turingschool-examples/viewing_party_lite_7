require "rails_helper" 

RSpec.describe "New Viewing Party Page", type: :feature do \
  before(:each) do 
    movie_detailsj2 = File.read('spec/fixtures/movie_details_jaws2.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/?api_key=#{ENV['TMDB-KEY']}&append_to_response=credits,reviews,images").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.9'
        }).
    to_return(status: 200, body: movie_detailsj2, headers: {})
    
    @user1 = User.create!(name: "Max", email: "max@gmail.com")
    @user2 = User.create!(name: "Maggie", email: "maggie@gmail.com")
    @user3 = User.create!(name: "Wolfie", email: "Wolfie@gmail.com")
    @user4 = User.create!(name: "Taro Boba", email: "TaroBoba@gmail.com")
    @user5 = User.create!(name: "Momo", email: "Momo@gmail.com")

    visit "/users/#{@user1.id}/movies/579/viewing-party/new"
  end
  
  describe "new viewing party form" do 
    it "displays the name of the movie title above the form" do 
      save_and_open_page
      expect(page).to have_content("Jaws 2 Viewing Party")
    end

    it "has a duration of party with default value of movie runtime in minutes" do 
      expect(page).to have_field("duration", with: "116")
    end

    it "has a form to create a new party with valid data" do 
      select "2023", from: "[day(1i)]"
      select "July", from: "[day(2i)]"
      select "8", from: "[day(3i)]"
      select "16", from: "[start_time(4i)]"
      select "30", from: "[start_time(5i)]"
      check("Maggie")
      check("Taro Boba")
      check("Momo")
      click_button "Save"

      expect(current_path).to eq(user_path(@user1))
      within('#viewing_parties_hosting') do
        expect(page).to have_content("Jaws 2- Viewing Party")
      end
      
      visit user_path(@user2)
      within('#viewing_party_invitations') do
        expect(page).to have_content("Jaws 2- Viewing Party")
      end
      
      visit user_path(@user4)
      within('#viewing_party_invitations') do
        expect(page).to have_content("Jaws 2- Viewing Party")
      end

      visit user_path(@user5)
      within('#viewing_party_invitations') do
        expect(page).to have_content("Jaws 2- Viewing Party")
      end
    end
  end
end