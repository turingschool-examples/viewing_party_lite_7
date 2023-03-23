require "rails_helper"

RSpec.describe "New User Registration Page" do
  before(:each) do
    @user = User.create!(name: "Bob", email: "bob@bob.bob")
    VCR.use_cassette(:movie_details, serialize_with: :json) do
      visit "/users/#{@user.id}/movies/238"
    end
  end
  
  describe 'As a visitor when I visit a movie show page' do
    describe 'I should see the movie details' do
      it 'should have a title, runtime, vote_average, genres, and summary' do
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("175")
        expect(page).to have_content("8.7")
        expect(page).to have_content("Drama")
        expect(page).to have_content("Crime")
        expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family")
      end

      it 'should have a list of cast members' do
        expect(page).to have_content("Marlon Brando")
        expect(page).to have_content("Al Pacino")
        expect(page).to have_css(".cast_member", count: 10)
      end
    end
  end
end