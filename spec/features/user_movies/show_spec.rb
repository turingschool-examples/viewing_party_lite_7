require "rails_helper" 

RSpec.describe "Movie Details Page", type: :feature do
  before(:each) do 
    @user = User.create!(name: "Neato", email: "neato@gmail.com")
  end
  describe "details page content" do 
    it "has a title, vote, runtime, summary, and count of reviews" do 
      visit "/user/#{@user.id}/movies/157336"
      save_and_open_page
    end

    it "lists genres" do 

    end

    it "lists first 10 cast members" do 

    end

    it "lists the content of each review with the author's name" do 

    end
  end
end