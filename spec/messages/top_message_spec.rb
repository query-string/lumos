require "spec_helper"

describe Lumos::TopMessage do
  it "returns message" do
    expect(described_class.new(message: "Immobulus").message).to eq("#########\nImmobulus")
  end
end
