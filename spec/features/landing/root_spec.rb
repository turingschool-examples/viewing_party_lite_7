require "rails_helper"

describe "landing page" do
  before :each do
    test_data
    visit root_path
  end

  it "has the title of the application" do
    expect(page).to have_content("Viewing Party")
  end

  it "has a button to create a new user" do
    expect(page).to have_button("Create New User")
  end

  it "has a list of existing users which links to the users dashboard" do
    expect(page).to have_link(@user1.email)
    expect(page).to have_link(@user2.email)
    click_link(@user1.email)

    expect(current_path).to eq(user_path(@user1))
  end
  
  it "has link to users index" do
    expect(page).to have_link("Existing Users")

    click_link("Existing Users")

    expect(current_path).to eq(users_path)
  end

  it "links to go back to the landing page" do
    expect(page).to have_link("Go Home")

    click_link("Go Home")

    expect(current_path).to eq(root_path)
  end
end