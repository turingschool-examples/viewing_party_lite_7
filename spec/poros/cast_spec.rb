# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cast do
  it 'exists' do
    attrs = {
      character: 'Dr. Strangelove',
      name: 'Peter Sellers'
    }

    cast = Cast.new(attrs)

    expect(cast).to be_a Cast
    expect(cast.character).to eq('Dr. Strangelove')
    expect(cast.name).to eq('Peter Sellers')
  end
end
