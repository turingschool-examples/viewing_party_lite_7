require "rails_helper"
RSpec.describe "index page" do
  let!(:user_1) { create(:user) }
  it "can create a new user" do
    visit "/register"
    fill_in(:name, with: "Bill")
    fill_in(:email, with: "Bill@email.com")
    click_button "Submit"
    expect(page).to have_content("Bill")
    expect(page).to have_content("Bill@email.com")
  end
  it "expects valid form" do
    visit "/register"
    fill_in(:name, with: "Bill")
    click_button "Submit"
    expect(page).to have_content("Name and email must be valid")
  end
end