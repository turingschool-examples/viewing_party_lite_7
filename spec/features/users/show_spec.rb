require "rails_helper"

RSpec.feature "Welcome Index" do
  it "has a header" do
    load_test_data

    visit user_path(@anne)

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")

    click_link "Home"

    expect(page).to have_current_path("/")
  end

  it "has a sub header" do
    load_test_data
    
    visit user_path(@anne)

    expect(page).to have_content("#{@anne.name}'s Dashboard")
    expect(page).to have_button("Discover Movies")

    # click_button "Discover Movies"

    # expect(page).to have_current_path(user_discover_path(@anne))
  end

  it "shows viewing parties" do 
    load_test_data
    
    visit user_path(@anne)

    expect(find("#party-#{@arthor.id}")).to have_content("Arthor")
    expect(find("#party-#{@arthor.id}")).to have_content(@arthor.date_formatter)
    expect(find("#party-#{@arthor.id}")).to have_content("140 min")
    expect(find("#party-#{@arthor.id}")).to have_content(@arthor.date_formatter)
    expect(find("#party-#{@arthor.id}")).to have_content("Hosting")
    
    expect(find("#party-#{@candyman.id}")).to have_content("Invited")
  end

end