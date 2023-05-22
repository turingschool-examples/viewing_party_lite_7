require 'rails_helper'

RSpec.describe "Logging In" do
  before do
    @user = User.create!(name: "Meg", email: "meg@meg.meg", password: "123test", password_confirmation: "123test")
  end
  it "can visit login page" do
    visit root_path

    expect(page).to have_link("Log In")
    click_on "Log In"
    expect(current_path).to eq(login_path)
  end

  it "can log in with valid credentials" do
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_on "Log In"

    expect(current_path).to eq(user_dashboard_path(@user))
    expect(page).to have_content("Welcome, Meg!")
  end

  it "must fill out both fields" do
    visit login_path

    fill_in :email, with: @user.email

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")

    fill_in :email, with: @user.email

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
  it "cannot log in with invalid credentials" do
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: "123"
    click_on "Log In"
    
    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
    
    fill_in :password, with: @user.password
    fill_in :email, with: "jon@jon.jon"
    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end