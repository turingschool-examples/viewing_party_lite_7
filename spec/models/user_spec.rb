# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name).with_message('must be filled out') }
    it { should validate_presence_of(:email).with_message('must be filled out') }
    it { should validate_uniqueness_of(:email).with_message('is already taken') }
  end
end
