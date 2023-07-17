# As a registered user
# When I visit the landing page `/`
# I see a link for "Log In"
# When I click on "Log In"
# I'm taken to a Log In page ('/login') where I can input my unique email and password.
# When I enter my unique email and correct password 
# I'm taken to my dashboard page
require "rails_helper"

RSpec.describe "Happy Path Logging in" do
  it "can log in with valid credentials" do
    user3 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com',  password: 'wolf', password_confirmation: 'wolf')

    # user = User.create(username: "funbucket13", password: "test")

    visit root_path

    click_on"Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user3.email
    fill_in :password, with: user3.password
    click_on "Log In"

    expect(current_path).to eq(user_path(user3))
    # expect(page).to have_content("Welcome, #{user3.name}")
  end

  xit "cannot log in with bad credentials" do
    user = User.create(username: "funbucket13", password: "test")
    visit login_path
  

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end