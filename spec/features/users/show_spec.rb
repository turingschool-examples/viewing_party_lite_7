require 'rails_helper'

RSpec.describe "User Show Page/ Dashboard" do 
  before :each do 
    @u1 = User.create!(name: 'Brian', email: 'brian@brian.com')
    @u2 = User.create!(name: 'Lorien', email: 'lorienlorienl.com')
    @u3 = User.create!(name: 'Rachel', email: 'rachel@rachel.com')

    # @vp1 = @u1.viewingparties.create!(title: "Movie 1", movie_id: 1, movie_image:,duration: 119, date: "10-31-2023", start_time: "09:00" )
    # @vp2 = @u1.viewingparties.create!(title: "Movie 2", movie_id: 2, movie_image:,duration: 100, date: "11-13-2023", start_time: "13:00" )
  end

  it "shows the User's information on the page" do 
    visit user_path(@u1)

    expect(page).to have_content("Brian's Dashboard")
    expect(page).to have_content("brian@brian.com")
    expect(page).to_not have_content("Rachel's Dashboard")
    expect(page).to_not have_content("rachel@rachel.com")
  end

  it "has a section for the viewing parties that a user has signed up for" do 
    visit user_path(@u2) 

    within("#viewing_parties") do 
      expect(page).to have_content("My Viewing Parties")
    end

  end

  it "has a button to take the user to discover movies" do 
    visit user_path(@u3)
    expect(page).to have_button("Discover Movies")

    click_button "Discover Movies"

    expect(current_path).to eq user_discover_index_path(@u3)
  end
end
