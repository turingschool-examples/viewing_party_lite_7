require 'rails_helper'

RSpec.describe Cast do 
  it 'exists' do 
    actress = Cast.new({name: 'Margot Robbie', character: 'Barbie'}) 
    expect(actress).to be_a(Cast)
    expect(actress).to respond_to(:name)
    expect(actress).to respond_to(:character)
  end
end