require "spec_helper"

describe Lumos::HorizontalMessage do
  it "returns message" do
    expect(described_class.new(message: "Meteolojinx Recanto").message).to eq("###################\nMeteolojinx Recanto\n###################")
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Mobiliarbus", delimiter: "❄").message).to eq("❄❄❄❄❄❄❄❄❄❄❄\nMobiliarbus\n❄❄❄❄❄❄❄❄❄❄❄")
  end

  it "returns 2-digit padding message" do
    expect(described_class.new(message: "Mobilicorpus", padding: 2).message).to eq("############\n\n\nMobilicorpus\n\n\n############")
  end

  it "returns multiline message" do
    expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
  end
end
