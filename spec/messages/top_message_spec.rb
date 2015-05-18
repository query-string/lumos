require "spec_helper"

describe Lumos::TopMessage do
  context "messages" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Immobulus").message).to eq("#########\nImmobulus")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("######################################################################\nCoffee has long had a reputation as being unhealthy. But in almost eve\nry single respect that reputation is backward. The potential health be\nnefits are surprisingly large.")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).message).to eq("###################################\nCoffee has long had a reputation as\n being unhealthy. But in almost eve\nry single respect that reputation i\ns backward. The potential health be\nnefits are surprisingly large.")
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect(described_class.new(message: "Imperio", padding: 0).message).to eq("#######\nImperio")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Imperio", padding: 1).message).to eq("#######\n\nImperio")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Imperio", padding: 2).message).to eq("#######\n\n\nImperio")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Impedimenta", delimiter: "★").message).to eq("★★★★★★★★★★★\nImpedimenta")
  end
end
