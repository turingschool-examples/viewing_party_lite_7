require "rails_helper"

describe "Movie Show Page", :vcr do
	before(:each) do
    @user_1 = User.create(name: "Bob", email: "bob@myemail.com")
    # visit user_discover_index_path(@user_1)
    # fill_in :movie_title, with: "Shawshank"
    # click_button "Search"

		# click_link "Movie: The Shawshank Redemption"
		visit "/users/#{@user_1.id}/movies/278"
  end

	it { expect(current_path).to eq("/users/#{@user_1.id}/movies/278") }

	describe "movie's detail page" do
		it "has a button to create a viewing party" do
			expect(page).to have_button("Create Viewing Party")

			click_button "Create Viewing Party"

			expect(current_path).to eq(new_user_movie_party_path(@user_1, 278))
		end

		it "has a button to return to Discovery Page" do
			expect(page).to have_button("Return to Discover Page")
			
			click_button "Return to Discover Page"

			expect(current_path).to eq(user_discover_index_path(@user_1))
		end
	end
end