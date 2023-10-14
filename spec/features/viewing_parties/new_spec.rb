require "rails_helper"

RSpec.describe "New Viewing Party Page" do
  before :each do 
    @user1 = User.create!(name: "Haley M", email: "haley@haley.com")
    @user2 = User.create!(name: "Camila T", email: "camila@camila.com")
    @user3 = User.create!(name: "Rachel V", email: "rachel@rachel.com")
    @user4 = User.create!(name: "Bret M", email: "bret@bret.com")

  end
  
  describe 'the new viewing party form' do
    it 'has all the proper fields to create a new viewing party' do

      stub_request(:get, "https://api.themoviedb.org/3/movie/3214?api_key=#{Rails.application.credentials.api_key}&movie_id=3214").
        to_return(status: 200, body: File.read("spec/features/fixtures/movie_details.json"), headers: {})

      stub_request(:get, "https://api.themoviedb.org/3/movie/3214/credits?api_key=#{Rails.application.credentials.api_key}&movie_id=3214").
        to_return(status: 200, body: File.read("spec/features/fixtures/movie_cast.json"), headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/?api_key=#{Rails.application.credentials.api_key}&movie_id").
        to_return(status: 200, body: File.read("spec/features/fixtures/movie_details.json"), headers: {})
      visit new_user_movie_viewing_party_path(user_id: @user1.id, movie_id: 3214)
 
      expect(page).to have_content("Movie Title: Santo")

      within(".new_party") do 
        expect(page).to have_field('Duration', with: "95 minutes")
        expect(page).to have_field :start_time
        expect(page).to have_unchecked_field('Camila T')
        expect(page).to have_unchecked_field('Rachel V')
        expect(page).to have_unchecked_field('Bret M')
        expect(page).to have_button('Create Party')
      end
    end
  end
end

