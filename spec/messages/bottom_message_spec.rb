require "spec_helper"

describe Lumos::BottomMessage do
  it "returns message" do
    expect(described_class.new(message: "Langlock").message).to eq("Langlock\n########")
  end
end
