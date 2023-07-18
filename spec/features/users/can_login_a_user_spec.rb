require "rails_helper"

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password")

    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Log In"

    expect(page).to have_content("Welcome, #{user.name}!")
  end

  it "cannot log in with invalid credentials" do
    user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password")

    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: "bobby@gmail.com"
    fill_in :password, with: user.password

    click_button "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end