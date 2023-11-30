require "rails_helper"

RSpec.describe MovieActor do
  it "exists" do
    attrs = {
      name: "Johnny Depp",
      character: "Captain Jack Sparrow",
    }

    actor = MovieActor.new(attrs)

    expect(actor).to be_a MovieActor
    expect(actor.name).to eq("Johnny Depp")
    expect(actor.character).to eq("Captain Jack Sparrow")
  end
end