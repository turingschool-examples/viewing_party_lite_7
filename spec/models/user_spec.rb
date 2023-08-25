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

  describe "relationships" do
    it { should have_many :user_viewing_parties }
    it { should have_many(:viewing_parties).through(:user_viewing_parties)}
  end
end
