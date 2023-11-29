require "rails_helper"

RSpec.describe "Show" do
  before :each do
    test_data 
  end

  it "A user's show page should show the user's name, a button to discover movie, and a list of viewing parties" do
    visit "/users/#{@user1.id}"

    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_content("Viewing Parties")
    expect(page).to have_content("The Lion Bling Watch Party")
    expect(page).to_not have_content("Leroy Jenkins Watch Party")
    expect(page).to_not have_content("Why Your Mom Moved Out Watch Party")
    
    click_button "Discover Movies"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
    
    visit "/users/#{@user2.id}"

    expect(page).to have_content("#{@user2.name}'s Dashboard")
  end

end