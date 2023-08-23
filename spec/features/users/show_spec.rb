require "rails_helper"

RSpec.describe "user show page" do
  before :each do
    @user1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user3 = User.create!(name: "Tom", email: "tom@yahoo.com", id: 3)
  end

  it "displays user's name dashboard at top of page" do
    visit "/users/1"

    expect(page).to have_content("Bob's Dashboard")
    expect(page).to_not have_content("Jane's Dashboard")
  end

  it "displays link to discover movies" do
    visit "/users/1"

    expect(page).to have_link("Discover Movies")

    visit "/users/2"

    expect(page).to have_link("Discover Movies")

    click_link "Discover Movies"

    expect(current_path).to eq("/users/2/discover")
  end

  it "displays section that lists viewing parties" do
    visit "/users/1"

    expect(page).to have_content("Viewing Parties")
  end
end