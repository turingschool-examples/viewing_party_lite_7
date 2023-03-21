require "rails_helper"

RSpec.describe "Registration Page" do 
  before(:each) do 
    visit "/register"
  end

  describe "when visiting  '/register' " do 
    it "should have a form with name, email, and a register button" do 
      within(".register_user") do
        expect(page).to have_field(:name)
        expect(page).to have_field(:email)
        expect(page).to have_button("Create New User")
      end
    end

    it "Once the user registers they should be taken to their show page" do 
      within(".register_user") do
        fill_in(:name, with: "Bob")
        fill_in(:email, with: "bob@builder.com")
        click_button("Create New User")
      end

      user = User.last

      expect(current_path).to eq(user_path(user))
    end
  end
end