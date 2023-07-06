require "rails_helper" 

RSpec.describe "User Show Page" do 
  before(:each) do 
    @user1 = User.create!(name: "Maggie", email: "maggie@gmail.com")
    visit "/users/#{@user1.id}"
  end
  describe "displays attributes" do 
    it "displays name and email" do 
      expect(page).to have_content("Email: #{@user1.email}")
    end
  end
  
  describe "US6 Dashboard (Show) Page" do
    it "I see user's name's Dashboard at the top of the page and a button to Discover Movies* " do
      save_and_open_page
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end
    
    it "US7 I go to a user dashbaord, and click 'Discover Movies button, I am redirected to a discover page '/users/:id/discover" do
      click_button("Discover Movies")
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end

  it "A section that lists viewing parties" 
  
  
end