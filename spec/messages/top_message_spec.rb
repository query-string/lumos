require "spec_helper"

describe Lumos::TopMessage do
  it "returns message" do
    expect(described_class.new(message: "Defodio").message).to eq("#######\nDefodio")
  end
end
