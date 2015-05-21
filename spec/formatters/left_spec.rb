# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Left do
  context "messages" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Engorgio").message).to eq("# Engorgio")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("# Coffee has long had a reputation as being unhealthy. But in almost eve\n# ry single respect that reputation is backward. The potential health be\n# nefits are surprisingly large.")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).message).to eq("# Coffee has long had a reputation as\n#  being unhealthy. But in almost eve\n# ry single respect that reputation i\n# s backward. The potential health be\n# nefits are surprisingly large.")
    end
  end

  context "paddings" do
    it "returns zero-digit padding message" do
      expect(described_class.new(message: "Episkey", padding: 0).message).to eq("#Episkey")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Episkey", padding: 1).message).to eq("# Episkey")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Episkey", padding: 2).message).to eq("#  Episkey")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Ennervate", delimiter: "☭").message).to eq("☭ Ennervate")
  end
end
