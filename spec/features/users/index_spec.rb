require 'rails_helper'

RSpec.describe 'Landing Page' do 
  before :each do
    load_test_data
  end

  it 'When a user visits the root path they should be on the landing page ('/') which includes:' do

    expect(page).to_have("ViewingPartyLite7")
    expect(page).to_have button("Create a New User")

    expect(page).to_have link("landing page")

  end