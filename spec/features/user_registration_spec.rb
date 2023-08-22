require "rails_helper"

describe "User Registration Page" do

  # When a user visits the '/register' path they 
  # should see a form to register.
  # The form should include:
  #  Name
  #  Email (must be unique)
  #  Register Button
  # Once the user registers they should be taken to a 
  # dashboard page '/users/:id', where :id is 
  # the id for the user that was just created.

  describe "when a user visits this '/register' path" do
    it "shows a form to register a user" do
      visit '/register'
      
      within '#registration_form' do
        expect(page).to have_content("Username")
        expect(page).to have_content("Email")
        expect(page).to have_button("Register")
      end
    end
  end
  it "Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created." do
    # user_1 = create(:user)
    visit '/register'
    within '#registration_form' do
      fill_in "Username", with: "Something1"
      fill_in "Email", with: "someth1@gamil.com"
      click_button "Register"
    end
    user = User.last
    expect(current_path).to eq("/users/#{user.id}")
  end
end