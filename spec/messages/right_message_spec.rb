require "spec_helper"

describe Lumos::RightMessage do
  context "messages" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Ferula").message).to eq("Ferula #")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect(described_class.new(message: "Finite Incantatum", padding: 0).message).to eq("Finite Incantatum#")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Finite Incantatum", padding: 1).message).to eq("Finite Incantatum #")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Finite Incantatum", padding: 2).message).to eq("Finite Incantatum  #")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Fidelius", delimiter: "->").message).to eq("Fidelius ->")
  end

end
