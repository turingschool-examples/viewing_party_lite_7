require "rails_helper"

describe "Register Page" do
  before :each do
    visit register_path
  end

  it 'when visiting /register the user will find a form to register' do
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_button("Register")
  end

  it 'can register the user' do
    fill_in :name, with: "Janet Love"
    fill_in :email, with: "janetlovescooking@aol.com"
    click_button "Register"
    # expect(current_path).to eq(user_path()) ## Not sure how to test the exact path on this one?
    expect(page).to have_content("Janet Love")
    expect(page).to have_content("janetlovescooking@aol.com")
  end
end