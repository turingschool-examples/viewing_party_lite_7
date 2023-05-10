require 'rails_helper'

RSpec.describe 'landing page index page' do
  let!(:user_1) { User.create!(name: "Angel Byun", email: "angelbyun@turing.edu", password: "ABC123") }
  let!(:user_2) { User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu", password: "234XYZ") }
  let!(:user_3) { User.create!(name: "Scott Le", email: "scottle@gmail.com", password: "098543") }
  let!(:user_4) { User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com", password: "BHAUI6") }

  it 'landing page index page' do
    visit root_path

    expect(page).to have_content("Landing Page")
  end

  xit 'creates a button to create a new user' do
    visit root_path
  end

  it 'displays a list of existing users which links to users dashboard' do
    visit root_path

    within "#user-#{user_1.id}" do
      click_link("#{user_1.name}")
    end

    expect(current_path).to eq(dashboard_path)
    
    # expect(page).to have_content(user_2.name)
    # expect(page).to have_content(user_3.name)
    # expect(page).to have_content(user_4.name)
  end
end