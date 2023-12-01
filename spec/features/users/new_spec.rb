require "rails_helper"

describe "the User Registration Page" do
  before(:each) do

  end

  it "shows the fields to enter new user information" do
    visit register_path
    expect(page).to have_content("Register an Account")
    expect(page).to have_field("user[name]", type: "text")
    expect(page).to have_field("user[email]", type: "email")
    expect(page).to have_button("Register")

    fill_in "user[name]", with: "Thomas Smith"
    fill_in "user[email]", with: "tsmith11@turing.edu"
    
    click_on("Register")
    
    x = User.find_by(email: "tsmith11@turing.edu")

    expect(current_path).to eq(user_dashboard_path(x.id))
    expect(page).to have_content("Thomas Smith's Dashboard")
    expect(page).to have_content("Parties I'm Hosting")
    expect(page).to have_content("Parties I'm Invited To")
    expect(page).to have_button("Discover Movies")
  end
end
