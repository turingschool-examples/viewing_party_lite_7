require "rails_helper"

RSpec.describe "User Discover Movies Page" do
  before do
    @ally = User.create!(name: "Ally Jean", email: "allyjean@example.com")
  end

  it "links from the user dashboard" do
    visit user_path(@ally)

    click_button("Discover Movies")
    expect(current_path).to eq(user_discover_path(@ally))

    expect(page).to have_content("Discover Movies")
  end
end