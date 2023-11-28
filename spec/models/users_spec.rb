# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe "model validations/relationships" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
    it { should have_many :party_users }
  end

  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'succeeds' do
      pending 'Not implemented'
    end
  end
end
