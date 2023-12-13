require "rails_helper"

RSpec.describe "New" do
  before :each do
    test_data 
  end

  it "can login" do
    visit "/login"

    fill_in :email, with: "Moogoo@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"
    user = @user3
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("#{@user3.name}")

  end

  it "can reject login if there are bad credentials, and communicae that" do
    visit "/login"

    fill_in :email, with: "Moogoo@gail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"
    expect(current_path).to eq("/login")
    expect(page).to have_content("You have entered the incorrect credentials")

    fill_in :email, with: "Moogoo@gmail.com"
    fill_in :password, with: "Helo123!"

    click_on "Log In"
    expect(current_path).to eq("/login")
    expect(page).to have_content("You have entered the incorrect credentials")

  end

  it "stays logged in, and can logout" do
    visit "/login"

    fill_in :email, with: "Moogoo@gmail.com"
    fill_in :password, with: "Hello123!"

    expect(page).to_not have_button("Log out")
    expect(page).to have_button("Login")
    user = @user3
    click_on "Log In"

    expect(current_path).to eq("/dashboard")

    expect(page).to_not have_button("Login")
    expect(page).to have_button("Log out")

    visit "/"
    expect(page).to_not have_button("Login")
    expect(page).to_not have_button("Create New User")
    expect(page).to_not have_link("Log in")
    expect(page).to have_button("Log out")

    visit "/discover"
    expect(page).to_not have_button("Login")
    expect(page).to have_button("Log out")

    click_on "Log out"
    expect(current_path).to eq("/")
    expect(page).to_not have_button("Log out")
    expect(page).to have_button("Login")

    visit "/login"
    expect(page).to_not have_button("Log out")
    expect(page).to have_button("Login")
  end
end
