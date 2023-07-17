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
    user1 = User.create!(user_name: "Steve", email: "Steve@email.com", password: 'password123', password_confirmation: 'password123')

    visit root_path

    expect(page).to have_link("Log In")

    click_on "Log In"

    expect(current_path).to eq("/login")

    fill_in :email, with: user1.email
    fill_in :password, with: user1.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user1))
  end

  it "cannot log in with bad credentials" do
    user1 = User.create!(user_name: "Steve", email: "Steve@email.com", password: 'password123', password_confirmation: 'password123')


    visit login_path


    fill_in :email, with: user1.email
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end