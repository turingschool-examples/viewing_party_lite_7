require "rails_helper"

RSpec.describe "Landing Page" do 
  before(:each) do 
    @user_1 = User.create!(name: "Joe Smith", email: "joey_smithy@yahooey.com")
    visit root_path
  end
  describe "when visiting  '/' " do 
    it "has the title of the application" do 
      expect(page).to have_content("Welcome to Viewing Party Lite")
    end

    xit "has a button to create a new user" do 

    end

    xit " has a list of existing users, which links to the users dashboard" do 

    end

    xit "has a link to go back to the landing page(on the top of every page)" do 

    end
  end
end