# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Vertical do
  context "messages" do
    it "returns message" do
      expect(described_class.new(message: "Obliviate").result).to eq("# Obliviate #")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").result).to eq("# Coffee has long had a reputation as being unhealthy. But in almost eve #\n# ry single respect that reputation is backward. The potential health be #\n# nefits are surprisingly large.                                         #")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).result).to eq("# Coffee has long had a reputation as #\n#  being unhealthy. But in almost eve #\n# ry single respect that reputation i #\n# s backward. The potential health be #\n# nefits are surprisingly large.      #")
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect(described_class.new(message: "Oppugno", padding: 0).result).to eq("#Oppugno#")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Oppugno", padding: 1).result).to eq("# Oppugno #")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Oppugno", padding: 2).result).to eq("#  Oppugno  #")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Obscuro", delimiter: "☢").result).to eq("☢ Obscuro ☢")
  end
end