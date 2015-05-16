require "spec_helper"

describe Lumos::VerticalMessage do
  it "returns message" do
    expect(described_class.new(message: "Obliviate").message).to eq("# Obliviate #")
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Obscuro", delimiter: "☢").message).to eq("☢ Obscuro ☢")
  end

  it "returns 2-digit padding message" do
    expect(described_class.new(message: "Oppugno", padding: 2).message).to eq("#  Oppugno  #")
  end

  it "returns multiline message" do
    expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
  end
end
