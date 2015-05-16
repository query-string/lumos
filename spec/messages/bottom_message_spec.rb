require "spec_helper"

describe Lumos::BottomMessage do
  it "returns wrapped message" do
    expect(described_class.new(message: "Langlock").message).to eq("Langlock\n########")
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Legilimens", delimiter: "☯").message).to eq("Legilimens\n☯☯☯☯☯☯☯☯☯☯")
  end

  it "returns 1-digit padding message" do
    expect(described_class.new(message: "Levicorpus", padding: 1).message).to eq("Levicorpus\n\n##########")
  end

  it "returns multiline message" do
    expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
  end
end
