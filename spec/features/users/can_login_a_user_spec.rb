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

  it "only shows existing users if logged in" do
    user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password")
    user1 = User.create!(name: "Javen", email: "javen@gmail.com", password: "password")

    visit root_path

    expect(page).to_not have_content("Existing Users")
    expect(page).to_not have_content(user1.email)

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Log In"

    expect(current_path).to eq(root_path)
    click_link "Home"

    expect(page).to have_content("Existing Users")
    expect(page).to have_content(user.email)
    expect(page).to have_content(user1.email)
  end

  it "can visit dashboard if logged in" do
    user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password")

    visit root_path
    click_link "Log In"
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"

    expect(current_path).to eq(root_path)

    visit dashboard_path

    expect(current_path).to eq(dashboard_path)
  end
end