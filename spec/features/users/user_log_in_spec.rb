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

  it "can log in with valid credentials" do
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
end

