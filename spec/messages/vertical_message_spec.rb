require "spec_helper"

describe Lumos::VerticalMessage do
  it "returns message" do
    expect(described_class.new(message: "Obliviate").message).to eq("# Obliviate #")
  end
end
