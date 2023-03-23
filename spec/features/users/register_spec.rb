require "rails_helper"

describe 'register page', :vcr do
	before do
		visit register_path
	end

	describe "there is a form to create a new user" do
		it "has the form" do
			expect(page).to have_field("Name")
			expect(page).to have_field("Email")
			expect(page).to have_button("Register")
		end
		
		it "can register a new user" do
			fill_in "Name", with: "John Doe"
			fill_in "Email", with: "johndoe@email.com"
			click_button "Register"

      user = User.find_by(email: "johndoe@email.com")
			expect(current_path).to eq(user_path(user))
		end

		it "will not allow a user to create account if email is invalid" do
			fill_in "Name", with: "John Doe"
			fill_in "Email", with: "johndoe"
			click_button "Register"
			
			expect(page).to have_content("Email is invalid")
		end
	end
end