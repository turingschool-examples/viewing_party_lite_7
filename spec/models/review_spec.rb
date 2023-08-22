require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:movie_id) }
  end

  describe 'relationships' do
    it { should belong_to(:movie) }
  end
end
