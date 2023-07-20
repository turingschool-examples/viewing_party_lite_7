require "rails_helper"

RSpec.describe "user login page", type: :feature do
  let(:user) { User.create!(
    name: "Myles",
    email: "myles@example.com",
    password: "random",
    password_confirmation: "random"
  ) }

  it "can log in with valid credentials" do
    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.email}!")
  end

  it "cannot log in with bad password" do
    visit login_path

    fill_in :email, with: user.email
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "cannot log in with bad email" do
    visit login_path

    fill_in :email, with: "bad@email.com"
    fill_in :password, with: "random"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end