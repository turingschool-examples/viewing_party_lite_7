require 'rails_helper'

RSpec.describe 'landing page index page' do
  it 'landing page index page' do
    visit root_path

    expect(page).to have_content("Landing Page")
  end
end