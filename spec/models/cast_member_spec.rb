require 'rails_helper'

RSpec.describe CastMember, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:character) }
    it { should validate_presence_of(:movie_id) }
  end

  describe 'relationships' do
    it { should belong_to(:movie) }
  end
end
