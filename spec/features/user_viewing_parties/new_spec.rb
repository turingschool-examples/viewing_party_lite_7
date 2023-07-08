require "rails_helper" 

RSpec.describe "New Viewing Party Page", type: :feature do \
  before(:each) do 
    movie_detailsj2 = File.read('spec/fixtures/movie_details_jaws2.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/579?api_key=#{ENV['TMDB-KEY']}&append_to_response=credits,reviews,images").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.9'
        }).
      to_return(status: 200, body: movie_detailsj2, headers: {})
    
    @user = User.create!(name: "Max", email: "max@gmail.com")

    visit "/users/#{@user.id}/movies/579/viewing-party/new"
  end

  describe "new viewing party form" do 
    it "displays the name of the movie title above the form" do 
      expect(page).to have_content("Jaws 2 Viewing Party")
    end

    it "has a duration of party with default value of movie runtime in minutes" do 
      expect(page).to have_content("Duration of Party: 116 minutes")
    end

    xit "has a form to create a new party" do 
      fill_in "When:", with: ""
    end
  end
end