require 'rails_helper'

RSpec.describe PreviewFacade do
  it 'converts parsed api results into poros', :vcr do
    poros = PreviewFacade.new('top_rated').movie_previews
    expect(poros).to be_an(Array)
    expect(poros.first).to be_a(Preview)
    expect(poros.first).to respond_to(:title)
    expect(poros.first).to respond_to(:vote)
    expect(poros.first).to respond_to(:id)
  end
end
