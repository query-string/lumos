# encoding: utf-8
require "spec_helper"

describe Lumos::HorizontalMessage do
  context "messages" do
    it "returns message" do
      expect(described_class.new(message: "Meteolojinx Recanto").message).to eq("###################\nMeteolojinx Recanto\n###################")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("######################################################################\nCoffee has long had a reputation as being unhealthy. But in almost eve\nry single respect that reputation is backward. The potential health be\nnefits are surprisingly large.\n######################################################################")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).message).to eq("###################################\nCoffee has long had a reputation as\n being unhealthy. But in almost eve\nry single respect that reputation i\ns backward. The potential health be\nnefits are surprisingly large.\n###################################")
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect(described_class.new(message: "Mobilicorpus", padding: 0).message).to eq("############\nMobilicorpus\n############")
    end

    it "returns 1-digit message" do
      expect(described_class.new(message: "Mobilicorpus", padding: 1).message).to eq("############\n\nMobilicorpus\n\n############")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Mobilicorpus", padding: 2).message).to eq("############\n\n\nMobilicorpus\n\n\n############")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Mobiliarbus", delimiter: "❄").message).to eq("❄❄❄❄❄❄❄❄❄❄❄\nMobiliarbus\n❄❄❄❄❄❄❄❄❄❄❄")
  end
end
