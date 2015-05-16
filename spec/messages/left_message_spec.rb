require "spec_helper"

describe Lumos::LeftMessage do
  it "returns wrapped message" do
    expect(described_class.new(message: "Engorgio").message).to eq("# Engorgio")
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Ennervate", delimiter: "☭").message).to eq("☭ Ennervate")
  end

  it "returns 2-digit padding message" do
    expect(described_class.new(message: "Episkey", padding: 2).message).to eq("#  Episkey")
  end

  it "returns multiline message" do
    expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
  end
end
