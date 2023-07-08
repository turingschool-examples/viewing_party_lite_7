require "rails_helper"

RSpec.describe "/users/:user_id/movies/:movie_id/viewing-party/new" do
  let!(:user) { create(:user) }

  before(:each) do
    @user = User.create!(name: "Silly Billy", email: "silly_billy@email.com")
    @movie = MovieFacade.get_movie(238)
    @user2 = create(:user)
    @user3 = create(:user)

    visit new_user_movie_viewing_party_path(@user, @movie.id)
  end

  describe "as a user on the viewing party page" do
    describe "the page has a title and discover button" do
      it "has a page title of Create a Movie Party for the 'Movie title'", :vcr do
        expect(page).to have_content("Create a Movie Party")
      end

      it "has a button to return to the discover page", :vcr do
        click_button "Discover Page"

        expect(current_path).to eq(user_discover_index_path(@user))
      end
    end

    describe "has a viewing party details form" do
      it "the page displays a form title", :vcr do
        expect(page).to have_content("Viewing Party Details")
      end

      it "has a fill in portion of the form", :vcr do
        within(".party_details") do
          expect(page).to have_content("Movie Title: #{@movie.title}")
          expect(page).to have_content("Duration of Party")
          expect(page).to have_content("#{@movie.runtime}")
          fill_in :date, with: "12/02/22"
          fill_in :start_time, with: Time.now
          expect(page).to have_content("Invite Other Users")
          check "#{@user2.name}"
          click_button "Create Party"
        end

        expect(current_path).to eq(user_path(@user))
      end

      xit "duration autopopulates with the movie's runtime, but is editable", :vcr do
        within(".duration") do
          expect(page).to have_content("Duration of Party")
          expect(page).to have_content("#{@movie.runtime}")
          fill_in "Duration of Party", with: 190
        end
      end
    end
  end
end