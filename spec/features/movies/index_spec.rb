require "rails_helper"

RSpec.describe "Movies Index" do
  before :each do
    @user1 = User.create!(name: 'User 1', email: 'user1@email.com')
  end

  describe "As a user when I visit the movies index page" do
    context "Top Rated Movies" do
      it "I should see the top 20 rated movies" do
        VCR.use_cassette(:top_movies, serialize_with: :json) do
          visit "/user/#{@user1.id}/movies?keyword=top+rated&commit=Top+Rated+Movies"
        end

        expect(page).to have_css(".movie", count: 20)
      end
    end

    context "Movies Search" do
      it "I should see first 20 movies with similar title" do
        VCR.use_cassette(:movies_search, serialize_with: :json) do
          visit "/user/#{@user1.id}/movies?keyword=fight&commit=Search"
        end

        expect(page).to have_css(".movie", count: 20)
      end
    end
  end
end