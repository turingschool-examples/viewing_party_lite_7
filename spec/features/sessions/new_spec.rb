require 'rails_helper' 

describe 'New Viewing Party Page' do
  before :each do
    @user = User.create!(name: "Jennifer", email: "Jenn@jen.com", password: "1234")
    visit "/"
  end

  it "has link to log in" do
    expect(page).to have_link("Login")
    click_link("Login")
    expect(current_path).to eq("/login")
  end

  it "can log in a user" do
    click_link("Login")
    fill_in :name, with: "Jennifer"
    fill_in :password, with: "1234"
    click_button("Log In")

    expect(current_path).to eq("/")
  end

  it "can log out a user" do
    click_link("Login")
    fill_in :name, with: "Jennifer"
    fill_in :password, with: "1234"
    click_button("Log In")
    click_button("Logout")
    
    expect(current_path).to eq("/login")
    expect(page).to have_content("Logged Out")
  end

  describe "sadpath" do
    it "must have name and password" do
      click_link("Login")
      fill_in :password, with: "1234"
      click_button("Log In")
  
      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid name or Password")
    end

    it "must have correct password" do
      click_link("Login")
      fill_in :name, with: "Jennifer"
      fill_in :password, with: "123456"
      click_button("Log In")
  
      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid name or Password")
    end

    it "must match user's name" do
      click_link("Login")
      fill_in :name, with: "1234"
      fill_in :password, with: "1234"
      click_button("Log In")

      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid name or Password")
    end
  end
end