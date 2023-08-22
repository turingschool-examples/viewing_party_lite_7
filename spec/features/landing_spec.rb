require "rails_helper"

RSpec.describe "Landing pages" do
  before(:each) do
    @user1 = User.create!(name: "Flick Chick", email: "flick@yahoo.com")
    @user2 = User.create!(name: "Rom Com Ron", email: "comron@yahoo.com")
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end

  it "should display title of application and link to landing page" do
    visit "/"

    expect(page).to have_content "Viewing Party"
    expect(page).to have_link "Home"
  end

  it "should have a button to create a new user" do
    visit "/"

    expect(page).to have_button("Create New User")
  end

  it "should list of existing users that are links to that user's dashboard" do
    visit "/"
    expect(page).to have_content "Existing Users"

    expect(page).to have_link(@user1.email)
    expect(page).to have_link(@user2.email)
    expect(page).to have_link(@user3.email)

    click_link(@user1.email)
    expect(current_path).to eq(user_path(@user1))
    expect(page).to have_link("Home")
  end
end
