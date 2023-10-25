require "rails_helper"

describe "Logging In" do
  it "can log in with valid credentials" do
    anne = User.create!(name: 'Anne Anderson', email: 'anne.anderson@aol.com', password: "dogs")

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: anne.email
    fill_in :password, with: anne.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to_not have_content("Log In")
  end

  it "(sad path)cannot log in with invalid credentials" do
    anne = User.create!(name: 'Anne Anderson', email: 'anne.anderson@aol.com', password: "dogs")

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: anne.email
    fill_in :password, with: "cats"

    click_on "Log In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad")
  end

  it "user can logout" do
    anne = User.create!(name: 'Anne Anderson', email: 'anne.anderson@aol.com', password: "dogs")

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: anne.email
    fill_in :password, with: anne.password

    click_on "Log In"

    expect(current_path).to eq('/')
    
    expect(page).to have_content("Log Out")
    
    click_link "Log Out"
    
    expect(current_path).to eq('/')
    expect(page).to have_content("Log In")
  end

  it "logged in user can see other users that are not links" do
    load_test_data

    visit "/"

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: @anne.email
    fill_in :password, with: @anne.password

    click_on "Log In"

    expect(current_path).to eq('/')
    
    expect(page).to have_content("Blair@aol.com")
    expect(page).to_not have_link("Blair@aol.com")
  end

  it "guest user cannot see other users that are not links" do
    load_test_data

    visit "/"

    expect(page).to_not have_content("Blair@aol.com")
    expect(page).to_not have_link("Blair@aol.com")
  end

  it "guest user cannot see user show pages" do
    load_test_data

    visit "/users/#{@anne.id}"

    expect(page).to have_content("The page you were looking for doesn't exist")

  end
end

