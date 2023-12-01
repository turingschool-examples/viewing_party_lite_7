require 'rails_helper'

RSpec.describe Preview do
  it 'exists' do
    preview = Preview.new({ original_title: 'Napoleon', vote_average: 6.5 })
    expect(preview).to be_a(Preview)
    expect(preview).to respond_to(:original_title)
    expect(preview).to respond_to(:vote_average)
  end
end
