require "rails_helper"

RSpec.describe "Registration Page" do 
  before(:each) do 
    visit "/register"
  end

  describe "when visiting  '/register' " do 
    it "should have a form with name, email, password and password confirmation, and a register button" do 
      within(".register_user") do
        expect(page).to have_field("user[name]")
        expect(page).to have_field("user[email]")
        expect(page).to have_field("user[password]")
        expect(page).to have_field("user[password_confirmation]")
        expect(page).to have_button("Create New User")
      end
    end

    it "Once the user registers they should be taken to their show page" do 
      email = "Hello@world.com"
      password = "asecurepassword"

      within(".register_user") do
        fill_in("user[name]", with: "Bob")
        fill_in("user[email]", with: "bob@builder.com")
        fill_in("user[password]", with: password)
        fill_in("user[password_confirmation]", with: password)
        click_button("Create New User")
      end

      user = User.last
      # require 'pry'; binding.pry

      expect(current_path).to eq(user_path(user))
    end

    it "Get an error message and return to '/register' with no new user created" do 
      within(".register_user") do
        fill_in("user[name]", with: '')
        fill_in("user[email]", with: "not_a_real_email@napster.com")
        click_button("Create New User")
      end

      user = User.last

      expect(current_path).to eq("/register")
      expect(user).to eq(nil)
      # expect(page).to have_content("Error: Invalid form entry")
      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(page).to have_content("Password can't be blank")
    end

    it "Get an error message and return to '/register' when a second user is made that is using an email that already exists and isn't made" do 
      user_1 = User.create!(name: "Bob", email: "bob@builder.com", password: "hellokitty", password_confirmation: "hellokitty")
      
      within(".register_user") do
        fill_in("user[name]", with: "Rob")
        fill_in("user[email]", with: "bob@builder.com")
        fill_in("user[password]", with: "password")
        fill_in("user[password_confirmation]", with: "password")
        click_button("Create New User")
      end

      user_2 = User.last

      expect(current_path).to eq("/register")
      expect(User.count).to eq(1)
      expect(User.count).to_not eq(2)
      expect(user_2.email).to eq("bob@builder.com")
      expect(user_2.name).to eq("Bob")
      expect(user_2.name).to_not eq("Rob")
      expect(page).to have_content("Email has already been taken")
    end
  end
end