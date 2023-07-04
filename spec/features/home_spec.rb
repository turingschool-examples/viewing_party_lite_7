require "rails_helper"

RSpec.describe "Home Page" do
  describe "Home page content" do
   before(:each) do
    @user1 = User.create!(name: "KD", email: "kd@gmail.com")
    @user2 = User.create!(name: "Amy", email: "amers@gmail.com")
    @user3 = User.create!(name: "Jess", email: "jess@gmail.com")
    visit "/"
  end

    it "I see the Title of the Application and a Button to Create New User" do
      expect(page).to have_content("Viewing Party Lite 7")
      click_button("Create New User")
      expect(current_path).to eq(new_user_path)
    end

    it "I see a List of Existing Users which links to the users dashboard" do
        
    end
    
    it "I see Link to go back to the landing page (this link will be present at the top of all pages)" 
  end
end