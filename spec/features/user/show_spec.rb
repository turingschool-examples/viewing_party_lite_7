require "rails_helper"

RSpec.describe "User Registration Page" do
  before do
    @user = User.create!(name: "Anna Wiley", email: "awiley33@gmail.com")
    visit user_path(@user)
  end

  it "displays Name's Dashboard at the top of the page" do
    expect(page).to have_content("Anna Wiley's Dashboard")
  end

  it "has a button to discover movies" do
    expect(page).to have_button("Discover Movies")
  end

  xit "has a section that lists this user's viewing parties" do

  end
end