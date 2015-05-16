require "spec_helper"

describe Lumos::TopMessage do
  it "returns wrapped message" do
    expect(described_class.new(message: "Immobulus").message).to eq("#########\nImmobulus")
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Impedimenta", delimiter: "★").message).to eq("★★★★★★★★★★★\nImpedimenta")
  end

  it "returns 1-digit padding message" do
    expect(described_class.new(message: "Imperio", padding: 1).message).to eq("#######\n\nImperio")
  end

  it "returns multiline message" do
    expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
  end
end
