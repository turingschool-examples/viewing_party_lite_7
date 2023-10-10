require 'rails_helper'

RSpec.describe 'Landing Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the root path they should be on the landing page ('/') which includes:' do

    visit "/"

    expect(page).to_have("ViewingPartyLite7")
    expect(page).to_have button("Create a New User")

    expect(page).to_have link("landing page")
    expect(page).to_have link("Tom")
    expect(page).to_have link("Jerry")
    expect(page).to_have link("Bob")

  end
end