# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_parties) }
    it { should have_many(:users).through(:viewing_parties) }
  end
end
