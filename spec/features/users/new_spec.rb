require "rails_helper"

describe "Register Page" do
  before :each do
    test_data
    visit register_path
  end

  it 'when visiting /register the user will find a form to register' do
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_button("Create New User")
  end

  it 'can register the user' do
    fill_in :name, with: "Janet Love"
    fill_in :email, with: "janetlovescooking@aol.com"
    fill_in :password, with: "1234"
    click_button "Create New User"
    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Janet Love's Dashboard")
  end

  describe "sad path testing" do
    it "must have a valid email format" do
      fill_in :name, with: "Janet Love"
      fill_in :email, with: "janetlovescooking"
      click_button "Create New User"

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Email is invalid")
    end

    it "cannot use an email that has already been used" do
      fill_in :name, with: "Janet Love"
      fill_in :email, with: "janetlovescooking@aol.com"
      fill_in :password, with: "janetpassword"
      click_button "Create New User"
      visit register_path
      fill_in :name, with: "Jackson"
      fill_in :email, with: "janetlovescooking@aol.com"
      fill_in :password, with: "jacksonpassword"
      click_button "Create New User"

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Email has already been taken")
    end

    it "must have a name and email" do
      click_button "Create New User"

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Name can't be blank, Email is invalid, Email can't be blank")
    end
  end
end