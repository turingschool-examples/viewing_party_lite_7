require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  let!(:user_1) { User.create!(name: "Angel Byun", email: "angelbyun@turing.edu") }
  let!(:user_2) { User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu") }
  let!(:user_3) { User.create!(name: "Scott Le", email: "scottle@gmail.com") }
  let!(:user_4) { User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com") }
end