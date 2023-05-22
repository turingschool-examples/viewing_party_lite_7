require 'rails_helper'

RSpec.describe "Logging In" do
  before do
    @user = User.create!(name: "Meg", email: "meg@meg.meg", password: "123", password_confirmation: "123")
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

  end
end