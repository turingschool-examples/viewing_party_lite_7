require 'rails_helper'

RSpec.describe "User Show Page/ Dashboard" do 
  before :each do 
    @u1 = User.create!(name: 'Brian', email: 'brian@brian.com')
    @u2 = User.create!(name: 'Lorien', email: 'lorienlorienl.com')
    @u3 = User.create!(name: 'Rachel', email: 'rachel@rachel.com')
  end

  it "shows the User's information on the page" do 
    visit user_path(@u1)

    expect(page).to have_content("Brian's Dashboard")
    expect(page).to have_content("brian@brian.com")
    expect(page).to_not have_content("Rachel's Dashboard")
    expect(page).to_not have_content("rachel@rachel.com")
  end
end