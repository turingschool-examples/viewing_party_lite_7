require "rails_helper"

# As a registered user
# When I visit the landing page `/`
# I see a link for "Log In"
# When I click on "Log In"
# I'm taken to a Log In page ('/login') where I can input my unique email and password.
# When I enter my unique email and correct password
# I'm taken to my dashboard page

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user1 = User.create!(user_name: "Steve", email: "Steve1@email.com", password: 'password123', password_confirmation: 'password123')

    visit root_path

    expect(page).to have_link("Log In")

    click_on "Log In"

    expect(current_path).to eq("/login")

    fill_in :email, with: user1.email
    fill_in :password, with: user1.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_path)
  end

  it "cannot log in with bad credentials" do
    user1 = User.create!(user_name: "Steve", email: "Steve2@email.com", password: 'password123', password_confirmation: 'password123')
    visit login_path

    fill_in :email, with: user1.email
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "can log out and take the user back to the landing page" do
    user1 = User.create!(user_name: "Steve", email: "Steve3@email.com", password: 'password123', password_confirmation: 'password123')

    visit login_path
    fill_in :email, with: user1.email
    fill_in :password, with: user1.password

    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    visit root_path

    expect(page).to have_link('Log Out')
    click_link('Log Out')

    expect(current_path).to eq(root_path)
    expect(page).to_not have_link('Log Out')
    expect(page).to have_link('Log In')
    expect(page).to have_link('Create User')
  end

  it "does not display the lists of existing users as a visitor" do
    visit root_path
    expect(page).to_not have_content("Existing Users")
  end

  it "will not let a visitor got to the dashboard page without logging in" do
    visit root_path

    visit dashboard_path

    expect(page).to have_content("You must be logged in to view this page.")

    expect(current_path).to eq(root_path)
  end
end