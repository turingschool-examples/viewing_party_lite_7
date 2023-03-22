require "rails_helper"

describe "User Show Page" do
  before(:each) do
    @user_1 = User.create(name: "Bob", email: "bob@myemail.com")
		@user_1.parties.create!(duration: 120, time: "12:00:00", date: "2021-08-01")
		visit user_path(@user_1)
  end

  it "can see the users name's dashboard at the top of the page" do
    expect(page).to have_content("Bob's Dashboard")
    expect(page).to_not have_content("Sally's Dashboard")
  end

  it "can see a button to discover movies" do
    expect(page).to have_button("Discover Movies")
  end

  it "list viewing parties" do
    expect(page).to have_content("Viewing Parties")
  end

	describe "discover movies" do
		it "takes user to discover page when the Discover Movies button is clicked" do
			click_button "Discover Movies"

			expect(current_path).to eq(user_discover_index_path(@user_1))
		end
	end
end