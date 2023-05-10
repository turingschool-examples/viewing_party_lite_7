require 'rails_helper'

RSpec.describe 'Application Layout' do
  scenario 'displays title of application on every page' do
    visit '/'
    within '#title' do
      expect(page).to have_content('Viewing Party')
    end
  end
end