require "rails_helper"

RSpec.describe "New" do
  before :each do
    test_data 
  end

  it "can create a new user with all attributes" do
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
    fill_in :password, with: "Hello123!"
    fill_in :password_confirmation, with: "Hello123!"
  
    click_button "Create New User"
    user = User.all.last
    expect(current_path).to eq("/dashboard")
    expect(user.name).to eq("Name")
  end

  it "rejects repeat emails" do
    visit "/register"
    expect(page).to_not have_content("Email has already been taken")
    
    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
    fill_in :password, with: "Hello123!"
    fill_in :password_confirmation, with: "Hello123!"
    
    click_button "Create New User"
    expect(page).to_not have_content("Email has already been taken")
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
    fill_in :password, with: "Hello123!"
    fill_in :password_confirmation, with: "Hello123!"
  
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("Email has already been taken")
  end

  it "rejects repeat emails" do
    visit "/register"
    expect(page).to_not have_content("can't be blank")
    
    fill_in "email", with: "email@email.com"
    fill_in :password, with: "Hello123!"
    fill_in :password_confirmation, with: "Hello123!"
    
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("Name can't be blank")

    fill_in "Name", with: "Name"
    fill_in :password, with: "Hello123!"
    fill_in :password_confirmation, with: "Hello123!"
  
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("Email can't be blank")

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
    fill_in :password_confirmation, with: "Hello123!"
  
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("Password can't be blank")

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
    fill_in :password, with: "Hello123!"
  
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("Password confirmation doesn't match Password")

    fill_in "Name", with: "Name"
    fill_in :password, with: "Hello123!"
  
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password confirmation doesn't match Password")

  end

end