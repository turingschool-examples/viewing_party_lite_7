require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Neato', email: 'neato@gmail.com')
    movie_detailsj2 = File.read('spec/fixtures/movie_details_jaws2.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/579?api_key=#{ENV['TMDB-KEY']}&append_to_response=credits,reviews,images").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.9'
        }).
        to_return(status: 200, body: movie_detailsj2, headers: {})
        
      movie_detailsj2_link = File.read('spec/fixtures/movie_details_jaws2.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/?api_key=#{ENV['TMDB-KEY']}&append_to_response=credits,reviews,images").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.9'
           }).
         to_return(status: 200, body: movie_detailsj2_link, headers: {})

      visit "/users/#{@user.id}/movies/579"
  end
  describe 'details page content' do
    it "has a link to create a viewing party" do 
      click_button "Create a Viewing Party" 
      expect(current_path).to eq("/users/#{@user.id}/movies/579/viewing-party/new")
    end

    it 'has a title, vote, runtime, summary, and count of reviews' do
      expect(page).to have_content("Jaws 2")
      expect(page).to have_content("Vote Average: 5.966")
      expect(page).to have_content("Runtime: 116")
      expect(page).to have_content("Summary:")
      expect(page).to have_content("Total Reviews: 5")
    end

    it 'lists genres' do
      expect(page).to have_content("Genres:")
      expect(page).to have_content("Horror")
      expect(page).to have_content("Thriller")
    end

    it 'lists first 10 cast members' do
      expect(page).to have_content("Cast:")
      expect(page).to have_content("Lorraine Gary")
      expect(page).to have_content("Roy Scheider")
      expect(page).to have_content("Murray Hamilton")
      expect(page).to have_content("Joseph Mascolo")
      expect(page).to have_content("Jeffrey Kramer")
      expect(page).to have_content("Collin Wilcox Paxton")
      expect(page).to have_content("Ann Dusenberry")
      expect(page).to have_content("Mark Gruner")
      expect(page).to have_content("Barry Coe")
      expect(page).to have_content("Susan French")
    end

    it "lists the content of each review with the author's name" do
      expect(page).to have_content("Reviews:")
      expect(page).to have_content("Author:")
      expect(page).to have_content("Ian Beale Review:")
    end
  end
end
