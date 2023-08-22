require "rails_helper"

RSpec.describe "Landing pages" do
  it "should display title of application" do
    visit "/"

    expect(page).to have_content "Viewing Party"
  end

  it "should have a button to create a new user" do
    visit "/"

    expect(page).to have_button("Create New User")
  end

  it "should list of existing users that are links to that user's dashboard" do
    visit "/"
    expect(page).to have_content "Existing Users"


    # user = build(:user)
    user1 = build(:user, name: "Movie person", email: "321movies@example.com")
    user2 = build(:user, name: "Flick Chick", email: "312movies@example.com")
    expect(page).to have_link("user.email")
    expect(page).to have_link("user1.email")
    expect(page).to have_link("user2.email")
  end

end


# When a user visits the root path they should be on the landing page ('/') which includes:

# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)