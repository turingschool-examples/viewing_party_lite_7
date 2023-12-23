require 'rails_helper'

RSpec.describe Top20Facade do
  describe 'initialize' do
    it 'exists' do
      VCR.use_cassette('top_20') do
        test = 'top 20'
        facade = Top20Facade.new(test)
        expect(facade).to be_instance_of(Top20Facade)
      end
    end
  end
  describe 'top20' do
    it 'finds the top 20' do
      VCR.use_cassette('top_20_method') do
        test = 'top 20'
        facade = Top20Facade.new(test)
        expect(facade.top20).to be_instance_of(Array)
        expect(facade.top20.count).to eq(20)
      end
    end
  end
end