require "rails_helper" 

RSpec.describe "User Show Page" do 
  before(:each) do 
    @user1 = User.create!(name: "Maggie", email: "maggie@gmail.com")
    visit "/users/#{@user1.id}"
  end

  describe "displays attributes" do 
    it "displays name and email" do 
      expect(page).to have_content("Name: #{@user1.name}")
      expect(page).to have_content("Email: #{@user1.email}")
    end
  end
end