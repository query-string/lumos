require "spec_helper"

describe Lumos::RightMessage do
  it "returns message" do
    expect(described_class.new(message: "Ferula").message).to eq("Ferula #")
  end
end
