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

  it "cannot log in with bad credentials" do
    user3 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com',  password: 'wolf', password_confirmation: 'wolf')
    visit root_path

    click_on"Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user3.email
    fill_in :password, with: "password"
    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry your email or password is incorrect")
  end
end