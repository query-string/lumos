require "spec_helper"

describe Lumos::BottomMessage do
  context "messages" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Langlock").message).to eq("Langlock\n########")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Coffee has long had a reputation as being unhealthy. But in almost eve\nry single respect that reputation is backward. The potential health be\nnefits are surprisingly large.\n######################################################################")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).message).to eq("Coffee has long had a reputation as\n being unhealthy. But in almost eve\nry single respect that reputation i\ns backward. The potential health be\nnefits are surprisingly large.\n###################################")
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect(described_class.new(message: "Levicorpus", padding: 0).message).to eq("Levicorpus\n##########")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Levicorpus", padding: 1).message).to eq("Levicorpus\n\n##########")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Levicorpus", padding: 2).message).to eq("Levicorpus\n\n\n##########")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Legilimens", delimiter: "☯").message).to eq("Legilimens\n☯☯☯☯☯☯☯☯☯☯")
  end

end
