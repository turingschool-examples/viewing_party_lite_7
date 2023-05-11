require 'rails_helper'

RSpec.describe Movie do 
  it 'exists' do
    attrs = {
      title: "Lock, Stock and Two Smoking Barrels",
      vote_average: 8.2,
      id: 100,
      runtime: 105,
      genres: ["Comedy", "Crime"],
      overview: "A card shark and his unwillingly-enlisted friends",
      poster_path: "/qVdEeQrDSIoYzQq1J3s2dDFtQr.jpg"
    }

    lockstock = Movie.new(attrs)

    expect(lockstock).to be_a(Movie)
    expect(lockstock.title).to eq("Lock, Stock and Two Smoking Barrels")
    expect(lockstock.vote_average).to eq(8.2)
    expect(lockstock.id).to eq(100)
    expect(lockstock.runtime).to eq(105)
    expect(lockstock.genres).to eq(["Comedy", "Crime"])
    expect(lockstock.summary).to eq("A card shark and his unwillingly-enlisted friends")
    expect(lockstock.poster).to eq("/qVdEeQrDSIoYzQq1J3s2dDFtQr.jpg")

  end
end