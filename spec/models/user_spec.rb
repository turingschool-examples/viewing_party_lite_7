# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # before(:each) do
  #   @user = User.new(name: "Sophie", email: "user@eamil.com")
  # end
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
